class DashboardController < ApplicationController
    def index
      @organization = Organization.find_by(id: OrganizationService::DEFAULT_ID)
      @pipes = Pipe.fetch_pipes.map { |pipe| PreparePipe.new(pipe) }
    end

    def fetch_data
      PipefyService.find_organization
      
      redirect_to '/'
    end
end
