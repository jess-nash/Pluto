class AddPetToMeals < ActiveRecord::Migration[6.1]
  def change
    add_reference :meals, :pet, null: false, foreign_key: true
  end
end
