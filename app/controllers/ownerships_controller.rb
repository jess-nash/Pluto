class OwnershipsController < ApplicationController
  def new
    @ownership = Ownership.new
    authorize @ownership
    # @ownerships = Ownership.where(title: params[:query])
    if params[:query].present?
      @users = User.where(email: params[:query])
    end
  end

  def create
    pets = current_user.pets
    user = User.find(params[:ownership][:user])
    ownerships = pets.map do |pet|
      ownership = Ownership.new({pet: pet, user: user})
      authorize ownership
    end

    if ownerships.all? { |ownership| ownership.save }
      redirect_to pets_path, notice: 'Family member was added!'
    else
      flash.now[:alert] = "That person is already added to your family!"
      render :new
    end
  end

  private

  def ownership_params
    params.require(:ownership).permit(:pet, :user)
  end
end
