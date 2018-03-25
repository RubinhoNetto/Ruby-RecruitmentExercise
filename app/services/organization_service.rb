class OrganizationService
  attr_accessor :response

  DEFAULT_ID = 92858

  def initialize(response)
    @response = response
  end

  def call
    return unless is_valid?
    
    organization = Organization.find_or_initialize_by(id: DEFAULT_ID)
    organization.name = @response.dig('organization', 'name')
    organization.save

    PipeService.new(@response.dig('organization', 'pipes'), organization).call
  end

  private

  def is_valid?
    @response.dig('organization')
  end
end