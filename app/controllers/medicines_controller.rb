class MedicinesController < ApplicationController
  def index
    @pet = Pet.find(params[:pet_id])
    @medicines = policy_scope(Medicine).where(pet: @pet)
  end

  def show
    @medicine = Medicine.find(params[:id])
    authorize @medicine
    @pet = @medicine.pet
  end
end
