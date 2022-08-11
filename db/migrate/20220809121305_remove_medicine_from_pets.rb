class RemoveMedicineFromPets < ActiveRecord::Migration[6.1]
  def change
    remove_reference :pets, :medicine, null: false, foreign_key: true
  end
end
