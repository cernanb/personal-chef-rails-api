class Api::V1::MembersController < ApplicationController
  # before_action :authenticate_token!, only: [:create]

  def index
    @members = Member.all
    render json: @members
  end

  def create
    household = Household.find_by(id: params[:household_id])
    @member = household.members.build(member_params)
    if @member.save
      render "members/show.json.jbuilder", member: @member
    else
      render json: {
        errors: @member.errors.full_messages
        }, status: 500
    end
  end

  private
    def member_params
      params.require(:member).permit(:first_name, :last_name, :email, :phone_number)
    end
end
