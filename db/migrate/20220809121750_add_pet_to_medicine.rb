class AddPetToMedicine < ActiveRecord::Migration[6.1]
  def change
    add_reference :medicines, :pet, null: false, foreign_key: true
  end
end
