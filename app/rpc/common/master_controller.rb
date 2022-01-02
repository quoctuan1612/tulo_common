# frozen_string_literal: true

module Common
  class MastersController < ::Gruf::Controllers::Base
    bind ::Tulo::Common::V1::MasterService::Service

    def get_countries_provinces_districts
      service = Common::GetCountriesProvincesDistrictsService.new(nil)
      service.run!
      presenter = Common::CountriesProvincesDistrictsPresenter.new(service.results)
      presenter.generate_response
    end

    def get_wards_by_district_id
      request_params = Common::GetWardsByDistrictIdRequestParams.new(request.message)
      request_params.validate!
      service = Common::GetWardsByDistrictIdService.new(request_params, nil)
      service.run!
      presenter = Common::WardsPresenter.new(service.results)
      presenter.generate_response
    end
  end
end
