# frozen_string_literal: true

module Common
  class UserIdRequestParams < TuloCommon::RequestParamsBase
    attribute :id, :integer

    def initialize(params)
      super(
        id: params.id&.value
      )
    end
  end
end
