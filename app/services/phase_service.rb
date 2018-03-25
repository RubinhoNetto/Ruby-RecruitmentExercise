class PhaseService
  attr_accessor :pipe, :response

  def initialize(response, pipe)
    @response = response
    @pipe = pipe
  end

  def call
    @response.each do |_phase|
      next unless is_valid?(_phase)
      
      phase = PhaseField.find_or_initialize_by(id: _phase.dig('id'))
      phase.name = _phase.dig('name')
      phase.pipe_id = @pipe.id
      phase.save

      FieldService.new(_phase.dig('fields'), phase).call
      CardService.new(_phase.dig('cards'), phase).call
    end
  end

  private

  def is_valid?(phase)
    phase.dig('id')
  end
end