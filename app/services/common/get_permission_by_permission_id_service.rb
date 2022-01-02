# frozen_string_literal: true

module Common
  class GetPermissionByPermissionIdService
    include ActiveModel::Model

    attr_reader :result

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      permission = Permission.find_by(id: @request_params.id)
      permission_details = PermissionDetail.where(permission_id: @request_params.id)

      raise ActiveRecord::RecordNotFound, I18n.t('errors.messages.permission.record_not_found', id: @request_params.id) if permission.blank?

      @result = {
        permission: permission,
        permission_details: permission_details
      }
    end
  end
end
