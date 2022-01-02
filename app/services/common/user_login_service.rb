# frozen_string_literal: true

module Common
  class UserLoginService
    include ActiveModel::Model

    attr_reader :result

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      user = User.find_by(user_name: @request_params.user_info)

      raise ActiveRecord::RecordNotFound, I18n.t('errors.messages.user.user_name_not_exist', user_name: @request_params.user_info) if user.blank?

      employee = get_employee_by_employee_id(user.employee_id)
      permission = Permission.find_by(role_id: employee.role_id&.value)
      permission_details = PermissionDetail.where(permission_id: permission&.id)

      @result = {
        employee_id: employee.id&.value,
        user_name: user.user_name,
        encrypted_password: user.encrypted_password,
        employee_name: get_full_name(employee.first_name&.value, employee.last_name&.value),
        email: employee.email&.value,
        phone: employee.phone&.value,
        role_id: employee.role_id&.value,
        department_id: employee.department_id&.value,
        right_to_do: permission_format(permission_details)
      }
    end

    private

    def get_employee_by_employee_id(employee_id)
      response = TuloCommon::GrpcService.call_grpc(
        nil,
        Settings.employees.host,
        Tulo::Employees::V1::EmployeeService,
        :GetEmployeeById,
        Tulo::Employees::V1::EmployeeIdRequest.new(
          id: Google::Protobuf::Int64Value.new(value: employee_id)
        ).to_h
      ).message

      response.employee
    end

    def get_full_name(first_name, last_name)
      "#{first_name} #{last_name}"
    end

    def permission_format(permission_details)
      permission_details&.each_with_object([]) do |permission_detail, arr|
        arr << OpenStruct.new(
          permission_name: permission_detail.permission_name,
          permission: permission_detail.permission,
          is_active: permission_detail.is_active
        )
      end
    end
  end
end
