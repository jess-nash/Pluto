class MedicinesController < ApplicationController
  def index
    @pet = Pet.find(params[:pet_id])
    @medicines = policy_scope(Medicine).where(pet: @pet)
  end

  def show
    @medicine = Medicine.find(params[:id])
    authorize @medicine
    @pet = @medicine.pet
    @pet.medicine_notifications.update(important: false)
  end

  def new
    @medicine = Medicine.new
    @pet = Pet.find(params[:pet_id])
    authorize @medicine
  end

  def create
    @medicine = Medicine.new(medicine_params)
    @pet = Pet.find(params[:pet_id])
    @medicine.pet = @pet
    authorize @medicine

    if @medicine.save
      redirect_to pet_medicines_path, notice: 'New medicine was added!'
    else
      render :new
    end
  end

  private

  def medicine_params
    params.require(:medicine).permit(
      :name, :dosage, :start_date, :end_date, :expiration_date, :description, :medicine_type, :important, photos: []
    )
  end
end
