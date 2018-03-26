class FieldService
  attr_accessor :phase, :response

  def initialize(response, phase)
    @response = response
    @phase = phase
  end

  def call
    @response.each do |_field|
      next unless valid?(_field)
      
      field = Field.find_or_initialize_by(value: _field.dig('id'))
      field.value = _field.dig('id')
      field.name = _field.dig('label')
      field.pipe_id = @phase.pipe_id
      field.phase_field_id = @phase.id
      field.save
    end
  end

  private

  def valid?(field)
    field.dig('id')
  end
end