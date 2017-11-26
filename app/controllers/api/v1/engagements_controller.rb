class Api::V1::EngagementsController < ApplicationController
  def create
    engagment = Engagement.new(engagement_params)

    if engagement.save
      render json: engagement
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
