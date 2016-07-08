require 'test_helper'

class ProposalMailerTest < ActionMailer::TestCase
  test "new_proposal" do
    mail = ProposalMailer.new_proposal
    assert_equal "New proposal", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
