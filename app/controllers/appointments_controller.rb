class AppointmentsController < ApplicationController
  def index
    @appointments = policy_scope(Appointment)
    @pet = Pet.find(params[:pet_id])
    # @appointments = @pet.appointments.order(time: :desc)
    @appointments = @pet.appointments.order(created_at: :desc)
  end

  def show
    # @pet = Pet.find(params[:pet_id])
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    @pet = @appointment.pet
    # when you click on one notif, all vanish instead of the specific one
    @pet.appointment_notifications.update(important: false)
  end

  def new
    @appointment = Appointment.new
    @pet = Pet.find(params[:pet_id])
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @pet = Pet.find(params[:pet_id])
    @appointment.pet = @pet
    authorize @appointment

    if @appointment.save
      redirect_to pet_appointments_path(@pet), notice: 'New appointment was made!'
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:name, :description, :appointment_type,
                                        :time, :location, :important, photos: [])
  end
end
