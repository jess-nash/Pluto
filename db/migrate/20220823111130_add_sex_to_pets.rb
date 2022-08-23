class AddSexToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :sex, :string
  end
end
