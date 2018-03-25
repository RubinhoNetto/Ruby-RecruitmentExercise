class CreatePhaseFields < ActiveRecord::Migration[5.1]
  def change
    create_table :phase_fields do |t|
      t.string :name
      t.references :pipe, foreign_key: true
      t.timestamps
    end
  end
end
