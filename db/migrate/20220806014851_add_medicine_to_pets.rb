class AddMedicineToPets < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :medicine, null: false, foreign_key: true
  end
end
