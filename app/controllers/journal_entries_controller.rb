class JournalEntriesController < ApplicationController
  def index
    @journals = policy_scope(JournalEntry)
    @journals_as_owner = current_user.journal_entries_as_owner.order(created_at: :desc)
    @pet = Pet.find(params[:pet_id])
  end

  def new
    @journal_entry = JournalEntry.new
    @pet = Pet.find(params[:pet_id])
    authorize @journal_entry
  end

  def create
    @journal_entry = JournalEntry.new(journal_entry_params)
    @pet = Pet.find(params[:pet_id])
    @journal_entry.pet = @pet
    authorize @journal_entry

    if @journal_entry.save
      redirect_to pet_journal_entries_path, notice: 'New journal entry was written!'
    else
      render :new
    end
  end

  private

  def journal_entry_params
    params.require(:journal_entry).permit(:name, :content, photos: [])
  end
end
