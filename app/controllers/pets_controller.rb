class PetsController < ApplicationController
<<<<<<< HEAD
  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new

  def profile
    @pet = Pet.find(params[:pet_id])
    authorize @pet
  end
end
