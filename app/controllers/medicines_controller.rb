class MedicinesController < ApplicationController
  def index
    @medicine = policy_scope(Medicine)
    @pet = Pet.find(params[:pet_id])
  end
end
