class Api::V1::HouseholdsController < ApplicationController
  before_action :authenticate_token!, only: [:index, :create]

  def index
    @households = current_user.households
    render "households/index.json.jbuilder", households: @households
  end

  def show
    household = Household.find(params[:id])

    render json: household
  end

  def create
    household = current_user.households.build(household_params)

    if household.save
      render json: household
    else
      render json: {
        errors: household.errors.full_messages
        }, status: 500
      end
    end

    def convert
      @household = Household.find(params[:household_id])
      @household.convert_to_client(params[:monthly_rate])
      render "households/show.json.jbuilder", household: @household
    end

    private
    def household_params
      params.require(:household).permit(:name, :monthly_rate, :address)
    end

  end
