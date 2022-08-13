class JournalEntriesController < ApplicationController
  def index
    @journals = policy_scope(JournalEntry).order(created_at: :desc)
    @journals_as_owner = current_user.journal_entries_as_owner
  end
end
