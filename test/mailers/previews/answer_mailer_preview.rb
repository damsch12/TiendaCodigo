# Preview all emails at http://localhost:3000/rails/mailers/answer_mailer
class AnswerMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/answer_mailer/send_answer
  def send_answer
    AnswerMailer.send_answer
  end
end
