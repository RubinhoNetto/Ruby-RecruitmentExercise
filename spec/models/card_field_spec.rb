require 'rails_helper'

RSpec.describe CardField, type: :model do
  it { should validate_presence_of(:value) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:card) }
end

