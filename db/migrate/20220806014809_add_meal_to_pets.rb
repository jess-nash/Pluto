class AddMealToPets < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :meal, null: false, foreign_key: true
  end
end
