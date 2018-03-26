class Pipe < ApplicationRecord
  belongs_to :organization
  
  has_many :cards, dependent: :destroy
  has_many :fields, dependent: :destroy
  has_many :phase_fields, dependent: :destroy

  scope :fetch_pipes, -> { includes(:fields) }

  validates_presence_of :name, :organization
end
