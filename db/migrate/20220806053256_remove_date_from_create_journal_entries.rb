class RemoveDateFromCreateJournalEntries < ActiveRecord::Migration[6.1]
  def change
    remove_column :journal_entries, :date
  end
end
