class PetsController < ApplicationController
  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
    authorize @pet
  end
end
