class PetsController < ApplicationController

  def index
    @pets = current_user.pets
  end

  def profile
    @pet = Pet.find(params[:pet_id])
    authorize @pet
  end
end
