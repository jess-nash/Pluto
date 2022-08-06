class RemovePetFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :pet, null: false, foreign_key: true
  end
end
