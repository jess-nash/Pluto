class MealsController < ApplicationController
  def index
    @pet_meal = policy_scope(Meal)
    @pet = Pet.find(params[:pet_id])
    @meals = @pet.meals.order(created_at: :desc)
  end

  def new
    @meal = Meal.new
    @pet = Pet.find(params[:pet_id])
    authorize @meal
  end

  def create
    @meal = Meal.new(meal_params)
    @pet = Pet.find(params[:pet_id])
    @meal.pet = @pet
    authorize @meal

    if @meal.save
      redirect_to pet_meals_path, notice: 'New journal entry was written!'
    else
      render :new
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:meal_type, photos: [])
  end
end
