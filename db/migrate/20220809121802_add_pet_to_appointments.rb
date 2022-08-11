class AddPetToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_reference :appointments, :pet, null: false, foreign_key: true
  end
end
