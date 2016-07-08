require 'test_helper'

class JobMailerTest < ActionMailer::TestCase
  test "add_job" do
    mail = JobMailer.add_job
    assert_equal "Add job", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
