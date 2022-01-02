# frozen_string_literal: true

module Common
  class UpsertPermissionService
    attr_reader :result

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      permission_exist?(@request_params.permission.role_id) if @request_params.permission.id.blank?
      permission = upsert_permission
      permission_details = upsert_permission_detail(permission)

      @result = {
        permission: permission,
        permission_details: permission_details
      }
    end

    private

    def upsert_permission
      if @request_params.permission.id.blank?
        permission = Permission.find_or_initialize_by(id: @request_params.permission.id)

        permission.role_id = @request_params.permission.role_id
        permission.description = @request_params.permission.description

        permission.save
        permission
      else
        permission = Permission.find_or_initialize_by(id: @request_params.permission.id)

        permission.description = @request_params.permission.description

        permission.save
        permission
      end
    end

    def upsert_permission_detail(permission)
      if @request_params.permission.id.blank?
        @request_params.permission_details.each_with_object([]) do |rec, arr|
          permission_detail = PermissionDetail.find_or_initialize_by(id: rec.id)

          permission_detail.permission_id = permission.id
          permission_detail.permission_name = rec.permission_name
          permission_detail.permission = rec.permission
          permission_detail.is_active = rec.is_active

          permission_detail.save
          arr << permission_detail
        end

      else
        @request_params.permission_details.each_with_object([]) do |rec, arr|
          permission_detail = PermissionDetail.get_permission_detail(rec.id, permission.id, rec.permission_name, rec.permission)&.first

          permission_detail.is_active = rec.is_active

          permission_detail.save
          arr << permission_detail
        end

      end
    end

    def permission_exist?(role_id)
      permission = Permission.find_by(role_id: role_id)

      if permission.present?
        raise TuloCommon::RequestParamsBase::InvalidRequestParams,
              OpenStruct.new(messages: { role_id: [I18n.t('errors.messages.permission.role_id_exist', role_id: role_id)] })
      end
    end
  end
end
