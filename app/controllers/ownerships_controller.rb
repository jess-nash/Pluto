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
    main_ownerships = current_user.ownerships.where(main: true)
    pets = main_ownerships.map do |ownership|
        ownership.pet
      end
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

  def create_ownership_from_pet
    @pet = Pet.find(params[:pet_id])
    ownership = Ownership.new({pet: @pet, user: current_user, main: true})
    authorize ownership
    if ownership.save
      redirect_to pets_path
    else
      render :new
    end
  end

  private

  def ownership_params
    params.require(:ownership).permit(:pet, :user)
  end
end
