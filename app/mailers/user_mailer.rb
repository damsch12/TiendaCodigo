# frozen_string_literal: true

# Mailer for users interactions
class UserMailer < ApplicationMailer
  default from: 'dscheck@codigodelsur.com'

  def question_submited_email
    @question = params[:question]
    mail(to: @question.email, subject: 'Your question has been submited')
  end
end
