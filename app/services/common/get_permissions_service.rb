# frozen_string_literal: true

module Common
  class GetPermissionsService
    include ActiveModel::Model

    attr_reader :results

    def initialize(auth_header)
      @auth_header = auth_header
    end

    def run!
      @results = Permission.all
    end
  end
end
