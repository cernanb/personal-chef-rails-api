class Api::V1::MealsController < ApplicationController

  def create
    meal = Meal.new(meal_params)

    if meal.save
      render json: meal
    else
      render json: {
        errors: meal.errors.full_messages
      }, status: 500
    end
  end

  def index
    @meals = Meal.all

    render json: @meals
  end

  private
    def meal_params
      params.require(:meal).permit(:name, :url)
    end

end