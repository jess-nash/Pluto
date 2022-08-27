class JournalEntriesController < ApplicationController
  before_action :authenticate_user!, only: :toggle_favorite

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

  def toggle_favorite
    @journal_entry = JournalEntry.find_by(id: params[:id])
    current_user.favorited?(@journal_entry) ? current_user.unfavorite(@journal_entry) : current_user.favorite(@journal_entry)
  end

  private

  def journal_entry_params
    params.require(:journal_entry).permit(:name, :content, photos: [])
  end
end
