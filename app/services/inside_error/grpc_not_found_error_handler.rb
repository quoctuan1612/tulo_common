# frozen_string_literal: true

module InsideError
  class GrpcNotFoundErrorHandler < TuloCommon::ErrorHandler::BaseHandler
    def run!
      custom_fail!(:not_found, @exception.message)
    end
  end
end
