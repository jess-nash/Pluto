class AddJournalEntryToPets < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :journal_entry, null: false, foreign_key: true
  end
end
