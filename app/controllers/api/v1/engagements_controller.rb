class Api::V1::EngagementsController < ApplicationController
  def create
    household = Household.find(params[:household_id])
    engagement = household.engagements.build(engagement_params)

    if engagement.save
      render json: household.next_engagement
    else
      render json: {
        errors: engagement.errors.full_messages
        }, status: 500
    end
  end

  def engagement_params
    params.require(:engagement).permit(:date)
  end
end
