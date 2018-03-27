require 'rails_helper'

RSpec.describe OrganizationService do

  let(:mock) do
    { 'data' => { 'organization' => { 'name' => 'Names', 'pipes' => [] } } }
  end

  context 'call' do
    context 'valid arguments' do
      it 'create and update' do
        expect do
          OrganizationService(mock).call
        end
      end
    end

    context 'invalid arguments' do
      it { expect{ OrganizationService.call([]) }.to_not raise_error }

      it do
        expect do
          OrganizationService.call(mock)
        end.to_not raise_error
      end
    end
  end
end