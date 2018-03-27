require 'rails_helper'

RSpec.describe CardService do

  let(:mock) do
    {
      'edges' => [
        {
          'node' => {
            'id' => 2,
            'title' => 'Updated Title',
            'created_at' => Time.now,
            'due_date' => Time.now,
            'fields' => []
          }
        }
      ]
    }
  end

  context 'call' do
    context 'valid arguments' do
      it 'create and update' do
        expect do
          CardService(mock).call
        end
      end
    end

    context 'invalid arguments' do
      it { expect{ CardService.call([]) }.to_not raise_error }

      it do
        expect do
          CardService.call(mock)
        end.to_not raise_error
      end
    end
  end
end