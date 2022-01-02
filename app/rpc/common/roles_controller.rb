# frozen_string_literal: true

module Common
  class RolesController < ::Gruf::Controllers::Base
    bind ::Tulo::Common::V1::RoleService::Service

    def get_role_by_id
      request_params = Common::RoleIdRequestParams.new(request.message)
      request_params.validate!
      service = Common::GetRoleByIdService.new(request_params, nil)
      service.run!
      presenter = Common::RolePresenter.new(service.result)
      presenter.generate_response
    end

    def get_roles
      service = Common::GetRolesService.new(nil)
      service.run!
      presenter = Common::RolesPresenter.new(service.results)
      presenter.generate_response
    end

    def upsert_role
      request_params = Common::UpsertRoleRequestParams.new(request.message)
      request_params.validate!
      service = Common::UpsertRoleService.new(request_params, nil)
      service.run!
      presenter = Common::UpsertRolePresenter.new(service.result)
      presenter.generate_response
    end

    def delete_role_by_id
      request_params = Common::RoleIdRequestParams.new(request.message)
      request_params.validate!
      service = Common::DeleteRoleService.new(request_params, nil)
      service.run!
      presenter = Common::DeleteRolePresenter.new(service.result)
      presenter.generate_response
    end
  end
end
