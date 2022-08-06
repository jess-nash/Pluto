class AddNameToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :name, :string
  end
end
