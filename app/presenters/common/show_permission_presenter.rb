# frozen_string_literal: true

module Common
  class ShowPermissionPresenter < PresenterBase
    def initialize(result)
      @result = result
    end

    def generate_response
      Tulo::Common::V1::PermissionResponse.new(
        permission: Tulo::Common::V1::Permission.new(
          id: proto_int64(@result[:permission].id),
          role_id: proto_string(@result[:permission].role_id),
          description: proto_string(@result[:permission].description),
          created_at: proto_string(@result[:permission].created_at),
          updated_at: proto_string(@result[:permission].updated_at)
        ),
        permission_details: @result[:permission_details].each_with_object([]) do |permission_detail, arr|
          arr << Tulo::Common::V1::PermissionDetail.new(
            id: proto_int64(permission_detail.id),
            permission_id: proto_int64(permission_detail.permission_id),
            permission_name: proto_string(permission_detail.permission_name),
            permission: proto_string(permission_detail.permission),
            is_active: proto_bool(permission_detail.is_active),
            created_at: proto_string(permission_detail.created_at),
            updated_at: proto_string(permission_detail.updated_at)
          )
        end
      )
    end
  end
end
