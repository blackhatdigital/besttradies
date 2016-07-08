# Preview all emails at http://localhost:3000/rails/mailers/job_mailer
class JobMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/job_mailer/add_job
  def add_job
    JobMailer.add_job
  end

end
