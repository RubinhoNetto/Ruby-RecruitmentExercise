class Pipe < ApplicationRecord
  belongs_to :organization
  
  has_many :cards, dependent: :destroy

  validates_presence_of :name, :organization
end
