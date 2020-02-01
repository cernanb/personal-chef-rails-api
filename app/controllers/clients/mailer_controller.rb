class Clients::MailerController < ApplicationController

  def send_survey
    SurveyMailer.survey_email(Member.first).deliver_now
    redirect_to '/'
  end
end