# frozen_string_literal: true

module Common
  class UserPresenter < PresenterBase
    def initialize(user)
      @user = user
    end

    def generate_response
      Tulo::Common::V1::UserResponse.new(
        user: Tulo::Common::V1::User.new(
          id: proto_int64(@user.id),
          employee_id: proto_int64(@user.employee_id),
          user_name: proto_string(@user.user_name),
          encrypted_password: proto_string(@user.encrypted_password),
          created_at: proto_string(@user.created_at),
          updated_at: proto_string(@user.updated_at)
        )
      )
    end
  end
end
