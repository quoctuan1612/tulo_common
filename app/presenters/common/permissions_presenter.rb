# frozen_string_literal: true

module Common
  class PermissionsPresenter < PresenterBase
    def initialize(permissions)
      @permissions = permissions
    end

    def generate_response
      Tulo::Common::V1::PermissionsResponse.new(
        permissions: @permissions.each_with_object([]) do |permission, arr|
          arr << Tulo::Common::V1::Permission.new(
            id: proto_int64(permission.id),
            role_id: proto_string(permission.role_id),
            description: proto_string(permission.description),
            created_at: proto_string(permission.created_at),
            updated_at: proto_string(permission.updated_at)
          )
        end
      )
    end
  end
end
