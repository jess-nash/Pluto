class ChangeFamiliesToOwnerships < ActiveRecord::Migration[6.1]
  def change
    rename_table :families, :ownerships
  end
end
