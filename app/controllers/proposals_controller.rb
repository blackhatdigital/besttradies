class ProposalsController < ApplicationController
	def create
		@job = Job.find(params[:job_id])
		@proposal = @job.proposals.build(proposal_params)
		@proposal.save
		redirect_to @proposal.job
	end

	def proposal_params
		params.require(:proposal).permit(:bid, :description, :user_id, :award_user)
	end	

end
