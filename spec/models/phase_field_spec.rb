require 'rails_helper'

RSpec.describe PhaseField, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:pipe) }
end

