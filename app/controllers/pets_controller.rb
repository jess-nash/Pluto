class PetsController < ApplicationController

  def index
    @pets = policy_scope(Pet).includes(:ownerships).order('ownerships.updated_at ASC')
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    authorize @pet
    if @pet.save
      redirect_to new_pet_ownership_path(pet_id: @pet.id)
    else
      render :new
    end
  end

  def profile
    @pet = Pet.find(params[:pet_id])
    authorize @pet
  end

  def edit
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def update
    @pet = Pet.find(params[:id])
    authorize @pet
    if @pet.update(pet_params)
      redirect_to @pet, notice: "Pet info successfuly updated."
    else
      render :edit
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.destroy
    redirect_to @pet, notice: 'Pet was successfully deleted.'
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :weight, :description, :chip_number, :sex, :photo)
  end
end
