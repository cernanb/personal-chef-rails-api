class HouseholdsController < ApplicationController

  def index
    @households = Household.all
    # @households = current_user.households
    render json: @households
  end

  def show
    household = Household.find(params[:id])

    render json: household
  end

end
