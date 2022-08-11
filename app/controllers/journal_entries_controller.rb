class JournalEntriesController < ApplicationController
  def index
    @journals = policy_scope(Journal).order(created_at: :desc)
    @journals_as_owner = current_user.journals_as_owner
  end
end
