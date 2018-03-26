class PhaseField < ApplicationRecord
  belongs_to :pipe

  has_many :cards, dependent: :destroy
  has_many :fields, dependent: :destroy

  scope :cards_phase, -> { includes(:cards) }

  validates_presence_of :name, :pipe
end
