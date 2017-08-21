class Api::V1::HouseholdMealsController < ApplicationController
  before_action :authenticate_token!, only: [:create]

  def create
    hhm = HouseholdMeal.new(household_meal_params)

    if hhm.save
      render json: hhm.meal.id
    else
      render json: {
        errors: hhm.errors.full_messages         
      }, status: 500
    end
  end

  private
    def household_meal_params
      params.permit(:household_id, :meal_id)
    end
end
