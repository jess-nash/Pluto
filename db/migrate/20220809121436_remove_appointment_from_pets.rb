class RemoveAppointmentFromPets < ActiveRecord::Migration[6.1]
  def change
    remove_reference :pets, :appointment, null: false, foreign_key: true
  end
end
