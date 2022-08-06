class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :name
      t.text :description
      t.string :appointment_type
      t.datetime :time
      t.string :location
      t.boolean :important, default: false

      t.timestamps
    end
  end
end
