class Field < ApplicationRecord
  belongs_to :pipe

  validates_presence_of :value, :name, :pipe, :phase_field_id
end
