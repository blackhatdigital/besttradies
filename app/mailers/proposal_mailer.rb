class ProposalMailer < ApplicationMailer
	default from: "noreply@besttradies.com.au"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.proposal_mailer.new_proposal.subject
  #
  def new_proposal(proposal)
    @proposals = proposal
    mail to: proposal.user.email, subject: "Thanks for submitting your proposal"
  end




end
