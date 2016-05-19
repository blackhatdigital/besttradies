class ProposalsController < ApplicationController

	def create
		@job = Job.find(params[:job_id])

		@proposal = @job.proposals.build(proposal_params)

		if @proposal.save
			redirect_to @proposal.job
		else
			render :new
		end
	end

	def proposal_params
		params.require(:proposal).permit(:bid, :description, :user_id, :owner_id, :award_user)
	end	

	def myproposals
		@proposals = Proposal.where(user_id: current_user.id).order("created_at DESC")
	end

	private



end
