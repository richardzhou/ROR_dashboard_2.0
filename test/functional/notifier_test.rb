require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "password_retrieve" do
    mail = Notifier.password_retrieve
    assert_equal "Password retrieve", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
