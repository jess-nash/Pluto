class RemoveJournalEntryFromPets < ActiveRecord::Migration[6.1]
  def change
    remove_reference :pets, :journal_entry, null: false, foreign_key: true
  end
end
