class CreateMedicines < ActiveRecord::Migration[6.1]
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :dosage
      t.date :start_date
      t.date :end_date
      t.date :expiration_date
      t.text :description
      t.string :medicine_type
      t.boolean :important, default: false

      t.timestamps
    end
  end
end
