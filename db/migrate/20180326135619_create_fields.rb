class CreateFields < ActiveRecord::Migration[5.1]
  def change
    create_table :fields do |t|
      t.string :value
      t.string :name
      t.references :pipe, foreign_key: true
      t.references :phase_field, foreign_key: true
      t.timestamps
    end
  end
end
