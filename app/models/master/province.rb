# frozen_string_literal: true

# == Schema Information
#
# Table name: master_provinces
#
#  id(ID)                           :bigint           not null, primary key
#  name(Name)                       :string           not null
#  code(Code)                       :bigint           not null
#  code_name(Code Name)             :string           not null
#  division_type(Division Type)     :string           not null
#  phone_code(Phone Code)           :bigint           not null
#  master_country_id(Conutry ID)    :bigint           not null
#  created_at(Created At)           :datetime         not null
#  updated_at(Updated At)           :datetime         not null
#

module Master
  class Province < ApplicationMasterRecord
    self.table_name = 'master_provinces'

    belongs_to :country
    has_many :districts, dependent: :destroy
  end
end
