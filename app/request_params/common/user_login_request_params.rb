# frozen_string_literal: true

module Common
  class UserLoginRequestParams < TuloCommon::RequestParamsBase
    attribute :user_info, :string

    validates :user_info, presence: true

    def initialize(params)
      super(
        user_info: params&.user_info&.value
      )
    end
  end
end
