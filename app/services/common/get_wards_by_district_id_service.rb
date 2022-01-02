# frozen_string_literal: true

module Common
  class GetWardsByDistrictIdService
    include ActiveModel::Model

    attr_reader :results

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      wards = Master::Ward.where(master_district_id: @request_params.district_id)

      raise ActiveRecord::RecordNotFound, I18n.t('errors.messages.ward.record_not_found', district_id: @request_params.district_id) if wards.blank?

      @results = {
        wards: wards
      }
    end
  end
end
