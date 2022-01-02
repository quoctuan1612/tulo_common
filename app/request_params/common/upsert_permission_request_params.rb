# frozen_string_literal: true

module Common
  class UpsertPermissionRequestParams < TuloCommon::RequestParamsBase
    attribute :permission
    attribute :permission_details

    def initialize(params)
      permission_details = get_permission_details(params.permission_details)

      super(
        permission: Common::PermissionRequestParams.new(params.permission),
        permission_details: permission_details
      )
    end

    private

    def get_permission_details(permission_details)
      permission_details.each_with_object([]) do |permission_detail, arr|
        arr << Common::PermissionDetailRequestParams.new(permission_detail)
      end
    end
  end
end
