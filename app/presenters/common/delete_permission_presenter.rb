# frozen_string_literal: true

module Common
  class DeletePermissionPresenter < PresenterBase
    def initialize(message)
      @message = message
    end

    def generate_response
      Tulo::Common::V1::CommonDeleteResponse.new(message: proto_bool(@message))
    end
  end
end
