# frozen_string_literal: true

module Common
  class GetUsersService
    include ActiveModel::Model

    attr_reader :results

    def initialize(auth_header)
      @auth_header = auth_header
    end

    def run!
      @results = User.all
    end
  end
end
