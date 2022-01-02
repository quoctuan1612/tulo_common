# frozen_string_literal: true

# == Schema Information
#
# Table name: permission
#
#  id(ID)                           :bigint           not null, primary key
#  role_id(Role ID)                 :string           not null
#  description(Description)         :string           null
#  created_at(Created At)           :datetime         not null
#  updated_at(Updated At)           :datetime         not null
#

class Permission < ApplicationRecord
  scope :where_role_id, ->(role_id) { where(role_id: role_id) if role_id.present? }
end
