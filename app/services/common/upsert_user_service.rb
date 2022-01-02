# frozen_string_literal: true

module Common
  class UpsertUserService
    include ActiveModel::Model

    attr_reader :result

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      user_exist?(@request_params) if @request_params.id.blank?

      @result = if @request_params.id.present?
                  update_user(@request_params)
                else
                  insert_user(@request_params)
                end
    end

    private

    def user_exist?(user)
      validate_employee_id(user.employee_id)
      validate_user_name(user.user_name)
    end

    def validate_user_name(user_name)
      user = User.find_by(user_name: user_name)
      if user.present?
        raise TuloCommon::RequestParamsBase::InvalidRequestParams,
              OpenStruct.new(messages: { user_name: [I18n.t('errors.messages.user.user_name_exist', user_name: user_name)] })
      end
    end

    def validate_employee_id(employee_id)
      user = User.find_by(employee_id: employee_id)
      if user.present?
        raise TuloCommon::RequestParamsBase::InvalidRequestParams,
              OpenStruct.new(messages: { employee_id: [I18n.t('errors.messages.user.employee_id_exist', employee_id: employee_id)] })
      end
    end

    def insert_user(user)
      user = User.find_or_initialize_by(user_name: @request_params.user_name)
      user.employee_id = @request_params.employee_id
      user.encrypted_password = @request_params.encrypted_password

      user.save
      user
    end

    def update_user(user)
      user = User.find_by(id: @request_params.id)

      raise ActiveRecord::RecordNotFound, I18n.t('errors.messages.user.record_not_found', id: @request_params.id) if user.blank?

      user.encrypted_password = @request_params.encrypted_password

      user.save
      user
    end
  end
end
