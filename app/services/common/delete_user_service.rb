# frozen_string_literal: true

module Common
  class DeleteUserService
    include ActiveModel::Model

    attr_reader :result

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      user = User.find_by(id: @request_params.id)

      raise ActiveRecord::RecordNotFound, I18n.t('errors.messages.user.record_not_found', id: @request_params.id) if user.blank?

      user.destroy

      @result = true
    end
  end
end
