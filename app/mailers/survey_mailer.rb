class SurveyMailer < ApplicationMailer
  default from: 'mychef@personalchef.com'

  def survey_email(member)
    @member = member
    mail(to: @member.email, subject: 'Chef Survey')
  end
end
