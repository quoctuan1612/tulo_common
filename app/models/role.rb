# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id(ID)                        :bigint           not null, primary key
#  role_id(Role ID)              :string           not null
#  role_name(Role Name)          :string           not null
#  description(Description)      :string           null
#  created_at(Created At)        :datetime         not null
#  updated_at(Updated At)        :datetime         not null
#

class Role < ApplicationRecord
  scope :where_role_id, ->(role_id) { where(role_id: role_id) if role_id.present? }
  scope :where_description, ->(description) { where(description: description) if description.present? }
end
