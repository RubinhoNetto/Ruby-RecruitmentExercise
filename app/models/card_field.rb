class CardField < ApplicationRecord
  belongs_to :card

  validates_presence_of :value, :name, :card
end
  