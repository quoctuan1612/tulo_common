# frozen_string_literal: true

# == Schema Information
#
# Table name: permission
#
#  id(ID)                             :bigint           not null, primary key
#  permission_id(Permission ID)       :int8             not null
#  permission_name(Permission Name)   :string           not null
#  permission(Permission)             :string           not null
#  is_active(Is Active)               :boolean          not null
#  created_at(Created At)             :datetime         not null
#  updated_at(Updated At)             :datetime         not null
#

class PermissionDetail < ApplicationRecord
  scope :get_permission_detail, ->(id, permission_id, permission_name, permission) { where(id: id, permission_id: permission_id, permission_name: permission_name, permission: permission) }
end
