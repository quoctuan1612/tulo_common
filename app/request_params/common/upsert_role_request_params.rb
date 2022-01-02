# frozen_string_literal: true

module Common
  class UpsertRoleRequestParams < TuloCommon::RequestParamsBase
    attribute :id, :integer
    attribute :role_id, :string
    attribute :role_name, :string
    attribute :description, :string

    validates :id, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
    validates :role_id,
              :role_name, presence: true

    def initialize(params)
      super(
        id: params.role&.id&.value,
        role_id: params.role&.role_id&.value,
        role_name: params.role&.role_name&.value,
        description: params.role&.description&.value
      )
    end
  end
end
