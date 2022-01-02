# frozen_string_literal: true

module Common
  class GetCountriesProvincesDistrictsService
    include ActiveModel::Model

    attr_reader :results

    def initialize(auth_header)
      @auth_header = auth_header
    end

    def run!
      countries = Master::Country.all

      provinces = Master::Province.all

      districts = Master::District.all

      @results = {
        countries: countries,
        provinces: provinces,
        districts: districts
      }
    end
  end
end
