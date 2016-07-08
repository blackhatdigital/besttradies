class JobMailer < ApplicationMailer
	default from: "noreply@besttradies.com.au"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.job_mailer.add_job.subject
  #
  def add_job(job)
    @job = job
    mail to: job.user.email, subject: "Thanks for adding a new job"
  end

  def new_proposal_job(job)
    @job = job
    mail to: job.user.email, subject: "Thanks for submitting your proposal"
  end
  
end
