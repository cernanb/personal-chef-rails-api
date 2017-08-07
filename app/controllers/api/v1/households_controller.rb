class Api::V1::HouseholdsController < ApplicationController
  before_action :authenticate_token!, only: [:index]

  def index
    @households = current_user.households
    render json: @households
  end

  def show
    household = Household.find(params[:id])

    render json: household
  end

end
