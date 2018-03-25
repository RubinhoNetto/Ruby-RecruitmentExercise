class Card < ApplicationRecord
  belongs_to :phase_field

  has_many :fields, dependent: :destroy

  def value(field_name)
    attributes.merge(fields_attributes).fetch(field_name, nil)
  end

  private

  def fields_attributes
    fields.each_with_object({}) do |field, hash|
      hash[field.name] = field.value
    end
  end
end
