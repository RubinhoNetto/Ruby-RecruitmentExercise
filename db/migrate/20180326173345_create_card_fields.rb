class CreateCardFields < ActiveRecord::Migration[5.1]
  def change
    create_table :card_fields do |t|
      t.string :value
      t.string :name
      t.references :card, foreign_key: true
      t.timestamps
    end
  end
end
