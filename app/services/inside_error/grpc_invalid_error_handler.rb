# frozen_string_literal: true

module InsideError
  class GrpcInvalidErrorHandler < TuloCommon::ErrorHandler::BaseHandler
    def run!
      custom_fail!(:invalid_argument, @exception.message)
    end
  end
end
