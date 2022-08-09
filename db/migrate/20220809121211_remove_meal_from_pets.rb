class RemoveMealFromPets < ActiveRecord::Migration[6.1]
  def change
    remove_reference :pets, :meal, null: false, foreign_key: true
  end
end
