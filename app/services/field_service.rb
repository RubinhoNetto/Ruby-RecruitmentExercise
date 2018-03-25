class FieldService
  attr_accessor :phase, :response

  def initialize(response, phase)
    @response = response
    @phase = phase
  end

  def call
    @response.each do |_field|
      next unless valid?(_field)
      
      field = Field.find_or_initialize_by(id: _field.dig('id'))
      field.label = _field.dig('label')
      field.phase_id = @phase.id
      field.save
    end
  end

  private

  def valid?(field)
    field.dig('id')
  end
end