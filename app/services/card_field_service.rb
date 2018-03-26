class CardFieldService
    attr_accessor :card, :response
  
    def initialize(response, card)
      @response = response
      @card = card
    end
  
    def call
      @response.each do |_card_field|
        next unless valid?(_card_field)
        
        card_field = CardField.find_or_initialize_by(card_id: @card.id, value: _card_field.dig('value'))
        card_field.value = _card_field.dig('value')
        card_field.name = _card_field.dig('name')
        card_field.card_id = @card.id
        card_field.save
      end
    end
  
    private
  
    def valid?(card_field)
      card_field.dig('value')
    end
  end