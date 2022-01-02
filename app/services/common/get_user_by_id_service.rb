# frozen_string_literal: true

module Common
  class GetUserByIdService
    include ActiveModel::Model

    attr_reader :result

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      user = User.find_by(id: @request_params.id)

      raise ActiveRecord::RecordNotFound, I18n.t('errors.messages.user.record_not_found', id: @request_params.id) if user.blank?

      @result = user
    end
  end
end
