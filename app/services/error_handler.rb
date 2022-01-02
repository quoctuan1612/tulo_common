# frozen_string_literal: true

module ErrorHandler
  HANDLER_MAP = {
    TuloCommon::RequestParamsBase::InvalidRequestParams => TuloCommon::ErrorHandler::InvalidRequestParamsHandler,
    ActiveRecord::RecordNotFound => InsideError::GrpcNotFoundErrorHandler,
    ActiveRecord::RecordInvalid => InsideError::GrpcInvalidErrorHandler,
    PermissionDeniedError => InsideError::GrpcPermissionDeniedErrorHandler
  }.freeze

  def self.handle_exception(request, exception)
    HANDLER_MAP[exception.class]&.new(request, exception)
  end
end
