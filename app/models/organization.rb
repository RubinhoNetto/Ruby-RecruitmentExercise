class Organization < ApplicationRecord
  has_many :pipes, dependent: :destroy

  validates_presence_of :name
end
