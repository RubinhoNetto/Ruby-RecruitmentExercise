require 'rails_helper'

RSpec.describe PipeService do

  let(:mock) do
    [{ 'id' => 2, 'name' => 'Pipe Name', 'phases' => [] }]
  end

  context 'call' do
    context 'valid arguments' do
      it 'create and update' do
        expect do
          PipeService(mock).call
        end
      end
    end

    context 'invalid arguments' do
      it { expect{ PipeService.call([]) }.to_not raise_error }

      it do
        expect do
          PipeService.call(mock)
        end.to_not raise_error
      end
    end
  end
end