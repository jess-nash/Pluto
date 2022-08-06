class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.integer :weight
      t.text :description
      t.string :chip_number

      t.timestamps
    end
  end
end
