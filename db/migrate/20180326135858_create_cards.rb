class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.datetime :created_at
      t.datetime :due_date
      t.references :pipe, foreign_key: true
      t.references :phase_field, foreign_key: true      
      t.timestamps
    end
  end
end
