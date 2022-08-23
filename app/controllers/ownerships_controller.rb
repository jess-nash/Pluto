class OwnershipsController < ApplicationController
  def new
    @ownership = Ownership.new
    @users = User.all
    authorize @ownership
  end

  def create
    pets = current_user.pets
    user = User.find(ownership_params[:user])
    ownerships = pets.map do |pet|
      ownership = Ownership.new({pet: pet, user: user})
      authorize ownership
    end

    if ownerships.all? { |ownership| ownership.save }
      redirect_to pets_path, notice: 'Family member was added!'
    else
      render :new
    end
  end

  private

  def ownership_params
    params.require(:ownership).permit(:pet, :user)
  end
end
