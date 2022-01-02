# frozen_string_literal: true

module Common
  class UserInfoPresenter < PresenterBase
    def initialize(user_info)
      @user_info = user_info
    end

    def generate_response
      Tulo::Common::V1::UserInfoResponse.new(
        employee_id: proto_int64(@user_info[:employee_id]),
        user_name: proto_string(@user_info[:user_name]),
        encrypted_password: proto_string(@user_info[:encrypted_password]),
        employee_name: proto_string(@user_info[:employee_name]),
        email: proto_string(@user_info[:email]),
        phone: proto_string(@user_info[:phone]),
        role_id: proto_string(@user_info[:role_id]),
        department_id: proto_int64(@user_info[:department_id]),
        right_to_do: @user_info[:right_to_do]&.each_with_object([]) do |rec, arr|
          arr << Tulo::Common::V1::RightToDo.new(
            permission_name: proto_string(rec.permission_name),
            permission: proto_string(rec.permission),
            is_active: proto_bool(rec.is_active)
          )
        end
      )
    end
  end
end
