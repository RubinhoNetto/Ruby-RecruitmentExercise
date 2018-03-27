require 'rails_helper'

RSpec.describe FieldService do

  let(:mock) do
    [{ 'id' => field.id, 'name' => 'Field' }]
  end

  context 'call' do
    context 'valid arguments' do
      it 'create and update' do
        expect do
          FieldService(mock).call
        end
      end
    end

    context 'invalid arguments' do
      it { expect{ FieldService.call([]) }.to_not raise_error }

      it do
        expect do
          FieldService.call(mock)
        end.to_not raise_error
      end
    end
  end
end