class AddPetToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :pet, null: false, foreign_key: true
  end
end
