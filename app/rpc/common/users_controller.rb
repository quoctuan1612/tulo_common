# frozen_string_literal: true

module Common
  class UsersController < ::Gruf::Controllers::Base
    bind ::Tulo::Common::V1::UserService::Service

    def get_users
      service = Common::GetUsersService.new(nil)
      service.run!
      presenter = Common::UsersPresenter.new(service.results)
      presenter.generate_response
    end

    def upsert_user
      request_params = Common::UpsertUserRequestParams.new(request.message)
      request_params.validate!
      service = Common::UpsertUserService.new(request_params, nil)
      service.run!
      presenter = Common::UpsertUserPresenter.new(service.result)
      presenter.generate_response
    end

    def get_user_by_id
      request_params = Common::UserIdRequestParams.new(request.message)
      request_params.validate!
      service = Common::GetUserByIdService.new(request_params, nil)
      service.run!
      presenter = Common::UserPresenter.new(service.result)
      presenter.generate_response
    end

    def delete_user_by_id
      request_params = Common::UserIdRequestParams.new(request.message)
      request_params.validate!
      service = Common::DeleteUserService.new(request_params, nil)
      service.run!
      presenter = Common::DeleteUserPresenter.new(service.result)
      presenter.generate_response
    end

    def user_login
      request_params = Common::UserLoginRequestParams.new(request.message)
      request_params.validate!
      service = Common::UserLoginService.new(request_params, nil)
      service.run!
      presenter = Common::UserInfoPresenter.new(service.result)
      presenter.generate_response
    end
  end
end
