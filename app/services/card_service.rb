class CardService
  attr_accessor :phase, :response

  def initialize(response, phase)
    @response = response
    @phase = phase
  end

  def call
    @response.dig('edges')&.each do |_card|
      next unless valid?(_card)
      
      card = Card.find_or_initialize_by(id: _card.dig('node', 'id'))
      card.title = _card.dig('node', 'title')
      card.created_at = _card.dig('node', 'created_at')&.to_time
      card.due_date = _card.dig('node', 'due_date')&.to_time
      card.pipe_id = @phase.pipe_id
      card.phase_field_id = @phase.id
      card.save

      CardFieldService.new(_card.dig('node', 'fields'), card).call
    end
  end

  private

  def valid?(card)
    card.dig('node', 'id')
  end
end