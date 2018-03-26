class Card < ApplicationRecord
  belongs_to :pipe

  has_many :card_fields, dependent: :destroy

  validates_presence_of :title, :pipe, :phase_field_id

  def field_value(colunm, card)
    card_fields.where(name: colunm).map { |field| field.value }.join("\n\n")
  end
end
