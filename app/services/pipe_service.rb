class PipeService
  attr_accessor :organization, :response

  def initialize(response, organization)
    @response = response
    @organization = organization
  end

  def call
    return unless is_valid?
    
    @response.each do |_pipe|
      pipe = Pipe.find_or_initialize_by(id: _pipe.dig('id'))
      pipe.name = _pipe.dig('name')
      pipe.organization_id = @organization.id
      pipe.save

      PhaseService.new(_pipe.dig('phases'), pipe).call
    end
  end

  private

  def is_valid?
    !@response.blank? && Organization.exists?(@organization&.id)
  end
end