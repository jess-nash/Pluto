class AddPetToJournalEntries < ActiveRecord::Migration[6.1]
  def change
    add_reference :journal_entries, :pet, null: false, foreign_key: true
  end
end
