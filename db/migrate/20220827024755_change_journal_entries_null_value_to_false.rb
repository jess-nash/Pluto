class ChangeJournalEntriesNullValueToFalse < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:journal_entries, :user_id, false, 0)
  end
end
