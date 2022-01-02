# frozen_string_literal: true

# == Schema Information
#
# Table name: master_countries
#
#  id(ID)                    :bigint           not null, primary key
#  name(Name)                :string           not null
#  code(Code)                :bigint           not null
#  code_name(Code Name)      :string           not null
#  phone_code(Phone Code)    :bigint           not null
#  created_at(Created At)    :datetime         not null
#  updated_at(Updated At)    :datetime         not null
#

module Master
  class Country < ApplicationMasterRecord
    self.table_name = 'master_countries'

    has_many :provinces, dependent: :destroy
  end
end
