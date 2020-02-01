class Clients::MailerController < ApplicationController

  def send_survey
    @member = Member.find_by(id: params[:id])
    if @member
      SurveyMailer.survey_email(@member).deliver_now
      return
    else 
      render json: {
        errors: ['Member not found!']
        }, status: 500
    end
  end
end