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

  def profile
    @pet = Pet.find(params[:pet_id])
    authorize @pet
  end
end
