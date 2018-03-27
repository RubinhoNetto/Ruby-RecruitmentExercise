require 'rails_helper'

RSpec.describe Pipe, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:organization) }
end

