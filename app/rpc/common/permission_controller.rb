# frozen_string_literal: true

module Common
  class PermissionController < ::Gruf::Controllers::Base
    bind ::Tulo::Common::V1::PermissionService::Service

    def get_permissions
      service = Common::GetPermissionsService.new(nil)
      service.run!
      presenter = Common::PermissionsPresenter.new(service.results)
      presenter.generate_response
    end

    def get_permission_by_id
      request_params = Common::PermissionIdRequestParams.new(request.message)
      request_params.validate!
      service = Common::GetPermissionByPermissionIdService.new(request_params, nil)
      service.run!
      presenter = Common::ShowPermissionPresenter.new(service.result)
      presenter.generate_response
    end

    def upsert_permission
      request_params = Common::UpsertPermissionRequestParams.new(request.message)
      request_params.validate!
      service = Common::UpsertPermissionService.new(request_params, nil)
      service.run!
      presenter = Common::UpsertPermissionPresenter.new(service.result)
      presenter.generate_response
    end

    def delete_permission_by_id
      request_params = Common::PermissionIdRequestParams.new(request.message)
      request_params.validate!
      service = Common::DeletePermissionService.new(request_params, nil)
      service.run!
      presenter = Common::DeletePermissionPresenter.new(service.result)
      presenter.generate_response
    end
  end
end
