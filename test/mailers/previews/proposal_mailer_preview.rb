# Preview all emails at http://localhost:3000/rails/mailers/proposal_mailer
class ProposalMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/proposal_mailer/new_proposal
  def new_proposal
    ProposalMailer.new_proposal
  end

end
