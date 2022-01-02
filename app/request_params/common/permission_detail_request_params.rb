# frozen_string_literal: true

module Common
  class PermissionDetailRequestParams < TuloCommon::RequestParamsBase
    attribute :id, :integer
    attribute :permission_id, :integer
    attribute :permission_name, :string
    attribute :permission, :string
    attribute :is_active, :boolean

    def initialize(permission_detail)
      super(
        id: permission_detail.id&.value,
        permission_id: permission_detail.permission_id&.value,
        permission_name: permission_detail.permission_name&.value,
        permission: permission_detail.permission&.value,
        is_active: permission_detail.is_active&.value,
      )
    end
  end
end
