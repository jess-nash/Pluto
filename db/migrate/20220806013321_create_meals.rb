class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :meal_type
      t.text :description
      t.string :serving_size
      t.string :time, array: true, default: []
      t.boolean :important, default: false

      t.timestamps
    end
  end
end
