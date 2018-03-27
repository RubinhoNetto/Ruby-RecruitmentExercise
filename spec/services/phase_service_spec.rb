require 'rails_helper'

RSpec.describe PhaseService do

  let(:mock) do
    [{ 'id' => 3, 'name' => 'Phase_field', 'fields' => [], 'cards' => {} }]
  end

  context 'call' do
    context 'valid arguments' do
      it 'create and update' do
        expect do
          PhaseService(mock).call
        end
      end
    end

    context 'invalid arguments' do
      it { expect{ PhaseService.call([]) }.to_not raise_error }

      it do
        expect do
          PhaseService.call(mock)
        end.to_not raise_error
      end
    end
  end
end