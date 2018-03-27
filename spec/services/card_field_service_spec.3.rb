require 'rails_helper'

RSpec.describe CardFieldService do

  let(:mock) do
    [
      {
        'name' => 'Name Card_Field',
        'value' => 'Field Dard_Field'
      }
    ]
  end

  context 'call' do
    context 'valid arguments' do
      it 'create and update' do
        expect do
          CardFieldService(mock).call
        end
      end
    end

    context 'invalid arguments' do
      it { expect{ CardFieldService.call([]) }.to_not raise_error }

      it do
        expect do
          CardFieldService.call(mock)
        end.to_not raise_error
      end
    end
  end
end