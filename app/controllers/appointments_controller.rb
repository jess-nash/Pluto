class AppointmentsController < ApplicationController
  def index
    @appointments = policy_scope(Appointment)
    @pet = Pet.find(params[:pet_id])
    @appointments = @pet.appointments.order(created_at: :desc)
  end
end
