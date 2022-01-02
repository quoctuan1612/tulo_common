# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id(Id)                         :bigint           not null, primary key
#  employee_id(Employee ID)       :bigint           not null
#  user_name(User Name)           :string           not null
#  encrypted_password(Password)   :string           not null
#  created_at(Created At)         :datetime         not null
#  updated_at(Updated At)         :datetime         not null
#

class User < ApplicationRecord
end
