# frozen_string_literal: true

module InsideError
  class GrpcPermissionDeniedErrorHandler < TuloCommon::ErrorHandler::BaseHandler
    def run!
      custom_fail!(:permission_denied, @exception.message)
    end
  end
end
