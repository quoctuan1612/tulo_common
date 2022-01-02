# frozen_string_literal: true

module Common
  class CountriesProvincesDistrictsPresenter < PresenterBase
    def initialize(countries_provinces_districts)
      @countries_provinces_districts = countries_provinces_districts
    end

    def generate_response
      Tulo::Common::V1::CountriesProvincesDistrictsResponse.new(
        countries: @countries_provinces_districts[:countries]&.each_with_object([]) do |country, arr|
          arr << Tulo::Common::V1::Country.new(
            id: proto_int64(country.id),
            name: proto_string(country.name),
            code: proto_int64(country.code),
            code_name: proto_string(country.code_name),
            phone_code: proto_int64(country.phone_code)
          )
        end,
        provinces: @countries_provinces_districts[:provinces]&.each_with_object([]) do |province, arr|
          arr << Tulo::Common::V1::Province.new(
            id: proto_int64(province.id),
            name: proto_string(province.name),
            code: proto_int64(province.code),
            code_name: proto_string(province.code_name),
            division_type: proto_string(province.division_type),
            phone_code: proto_int64(province.phone_code),
            master_country_id: proto_int64(province.master_country_id)
          )
        end,
        districts: @countries_provinces_districts[:districts]&.each_with_object([]) do |district, arr|
          arr << Tulo::Common::V1::District.new(
            id: proto_int64(district.id),
            name: proto_string(district.name),
            code: proto_int64(district.code),
            code_name: proto_string(district.code_name),
            division_type: proto_string(district.division_type),
            short_code_name: proto_string(district.short_code_name),
            master_province_id: proto_int64(district.master_province_id)
          )
        end
      )
    end
  end
end
