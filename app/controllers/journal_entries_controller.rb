class JournalEntriesController < ApplicationController
  def index
    @journals = policy_scope(JournalEntry)
    @pet = Pet.find(params[:pet_id])
    @journal_entries = @pet.journal_entries.order(created_at: :desc)
  end

  def new
    @journal_entry = JournalEntry.new
    @pet = Pet.find(params[:pet_id])
    authorize @journal_entry
  end

  def create
    @journal_entry = JournalEntry.new(journal_entry_params)
    @journal_entry.user = current_user
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
