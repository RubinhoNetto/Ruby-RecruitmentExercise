require 'rails_helper'

RSpec.describe Card, type: :model do

  subject(:card) { Card.new(id: 1, title: 'Title1', card_fields: card_fields) }
  let(:card_fields) { [ CardField.new(name: 'newCardField1', value: 'Value1', card: 1) ] }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:phase_field) }
  it { should validate_presence_of(:pipe) }

  describe '#field_value' do
    subject(:value) { card.field_value(column) }

    context 'verify column exist' do
      let(:column) { card_fields.first.value }

      it 'returns field value' do
        expect(value).to eq(card_fields.first.value)
      end
    end

    context 'verify field name does not exist in card' do
      let(:column) { 'xxx' }

      it 'returns nil' do
        expect(value).to be_nil
      end
    end
  end
end

