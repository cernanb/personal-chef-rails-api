# Preview all emails at http://localhost:3000/rails/mailers/survey_mailer
class SurveyMailerPreview < ActionMailer::Preview
  def survey_email
    SurveyMailer.survey_email(Member.first)
  end
end
