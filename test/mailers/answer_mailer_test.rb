require "test_helper"

class AnswerMailerTest < ActionMailer::TestCase
  test "send_answer" do
    mail = AnswerMailer.send_answer
    assert_equal "Send answer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
