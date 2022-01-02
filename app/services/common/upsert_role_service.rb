# frozen_string_literal: true

module Common
  class UpsertRoleService
    include ActiveModel::Model

    attr_reader :result

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      if @request_params.id.present?
        role = Role.find_by(id: @request_params.id)
        role.role_name = @request_params.role_name
        role.description = @request_params.description
        role.save

        @result = role
      else
        role_exist?(@request_params.role_id)

        role = Role.find_or_initialize_by(role_id: @request_params.role_id)
        role.role_id = @request_params.role_id
        role.role_name = @request_params.role_name
        role.description = @request_params.description
        role.save

        @result = role
      end
    end

    private

    def role_exist?(role_id)
      role = Role.find_by(role_id: role_id)

      if role.present?
        raise TuloCommon::RequestParamsBase::InvalidRequestParams,
              OpenStruct.new(messages: { role_id: [I18n.t('errors.messages.role.role_id_exist', role_id: role_id)] })
      end

      true
    end
  end
end
