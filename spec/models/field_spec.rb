require 'rails_helper'


RSpec.describe Field, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:value) }
  it { should validate_presence_of(:pipe) }
  it { should validate_presence_of(:phase_field_id) }
end

