class MealsController < ApplicationController
  def index
    @pet = Pet.find(params[:pet_id])
    @meals = policy_scope(Meal).where(pet: @pet).order(created_at: :desc)
  end

  def new
    @meal = Meal.new
    @pet = Pet.find(params[:pet_id])
    authorize @meal
  end

  def create
    binding.pry
    @meal = Meal.new(meal_params)
    @pet = Pet.find(params[:pet_id])
    @meal.pet = @pet
    authorize @meal

    if @meal.save
      redirect_to pet_meals_path, notice: 'New meal was added!'
    else
      render :new
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :meal_type, :serving_size, :description, :important, time: [], photos: [])
  end
end
