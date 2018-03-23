class DashboardController < ApplicationController
    def index
    end

    def fetch_data
      response = PipefyService.find_organization
      render json: { 'response': response }
    end
end
