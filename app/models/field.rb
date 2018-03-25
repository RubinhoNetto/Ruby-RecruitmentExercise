class Field < ApplicationRecord
  belongs_to :phase

  validates :name, :value, :card
end
