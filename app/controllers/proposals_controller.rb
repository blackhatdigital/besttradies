class ProposalsController < ApplicationController
	before_action :myproposals, only: [:index, :show, :new, :edit]

	def create
		@job = Job.find(params[:job_id])
		@proposal = @job.proposals.build(proposal_params)
		@proposal.save
		redirect_to @proposal.job
	end

	def proposal_params
		params.require(:proposal).permit(:bid, :description, :user_id, :award_user, :owner_id)
	end	

	def myproposals
		@proposals = Proposal.where(user_id: current_user.id).order("created_at DESC")

	end

end
