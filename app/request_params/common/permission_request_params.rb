# frozen_string_literal: true

module Common
  class PermissionRequestParams < TuloCommon::RequestParamsBase
    attribute :id, :integer
    attribute :role_id, :string
    attribute :description, :string

    def initialize(permission)
      super(
        id: permission.id&.value,
        role_id: permission.role_id&.value,
        description: permission.description&.value
      )
    end
  end
end
