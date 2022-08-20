class MedicinesController < ApplicationController
  def index
    @medicine = policy_scope(Medicine)
    @pet = Pet.find(params[:pet_id])
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
      redirect_to pet_medicine_path, notice: 'New medicine was added!'
    else
      render :new
    end
  end

  private

  def medicine_params
    params.require(:medicine).permit(
      :name, :dosage, :start_date, :end_date, :expiration_date, :description, :medicine_type, photos: []
    )
  end
end
