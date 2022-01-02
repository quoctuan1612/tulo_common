# frozen_string_literal: true

module Common
  class GetRolesService
    include ActiveModel::Model

    attr_reader :results

    def initialize(auth_header)
      @auth_header = auth_header
    end

    def run!
      @results = Role.all
    end
  end
end
