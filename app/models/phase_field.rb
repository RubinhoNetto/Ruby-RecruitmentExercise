class PhaseField < ApplicationRecord
  belongs_to :pipe

  has_many :cards, dependent: :destroy
  has_many :fields, dependent: :destroy

  validates_presence_of :name, :pipe
end
