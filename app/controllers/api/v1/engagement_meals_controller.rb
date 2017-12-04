class Api::V1::EngagementMealsController < ApplicationController

  def create
    em = EngagementMeal.new(meal_id: params[:meal_id], engagement_id: params[:engagement_id])
    
    if em.save
      render json: em.meal_id, status: 201
    end
  end

end