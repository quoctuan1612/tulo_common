# frozen_string_literal: true

module Common
  class UpsertUserRequestParams < TuloCommon::RequestParamsBase
    attribute :id, :integer
    attribute :employee_id, :integer
    attribute :user_name, :string
    attribute :encrypted_password, :string

    def initialize(params)
      super(
        id: params.user&.id&.value,
        employee_id: params.user&.employee_id&.value,
        user_name: params.user&.user_name&.value,
        encrypted_password: params.user&.encrypted_password&.value
      )
    end
  end
end
