class PetsController < ApplicationController
  def profile
    @pet = Pet.find(params[:pet_id])
    authorize @pet
  end
end
