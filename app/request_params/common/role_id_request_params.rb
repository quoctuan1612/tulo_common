# frozen_string_literal: true

module Common
  class RoleIdRequestParams < TuloCommon::RequestParamsBase
    attribute :role_id, :string

    def initialize(params)
      super(
        role_id: params.role_id&.value
      )
    end
  end
end
