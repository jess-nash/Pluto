class PetsController < ApplicationController

  def index
    @pets = policy_scope(Pet)
  end

  def profile
    @pet = Pet.find(params[:pet_id])
    authorize @pet
  end
end
