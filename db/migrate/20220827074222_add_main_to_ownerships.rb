class AddMainToOwnerships < ActiveRecord::Migration[6.1]
  def change
    add_column :ownerships, :main, :boolean, default: false
  end
end
