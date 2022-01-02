# frozen_string_literal: true

# == Schema Information
#
# Table name: master_wards
#
#  id(ID)                           :bigint           not null, primary key
#  name(Name)                       :string           not null
#  code(Code)                       :bigint           not null
#  code_name(Code Name)             :string           not null
#  division_type(Division Type)     :string           not null
#  short_code_name(Short Code Name) :string           not null
#  master_district_id(District ID)  :bigint           not null
#  created_at(Created At)           :datetime         not null
#  updated_at(Updated At)           :datetime         not null
#

module Master
  class Ward < ApplicationMasterRecord
    self.table_name = 'master_wards'

    belongs_to :district
  end
end
