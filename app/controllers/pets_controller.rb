class PetsController < ApplicationController

  def index
    @pets = policy_scope(Pet)
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
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
end
