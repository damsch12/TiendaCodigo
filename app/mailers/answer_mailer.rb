class AnswerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.answer_mailer.send_answer.subject
  #
  def send_answer
    @user = params[:user]
    @question = params[:question]
    @answer = params[:answer]
    byebug
    mail to: @question.email, from: @user.email, subject: 'Your question has been answered'
  end
end
