class JobsController < ApplicationController
	def index
		@jobs = Job.all.order("created_at DESC").page(params[:page]).per(25)
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.save
		redirect_to @job
	end

	def show
		@job = Job.find(params[:id])
		@proposals = @job.proposals.order("created_at DESC")
		@awarded_proposal = Proposal.where(id: @job.awarded_proposal).first
	end

	def update
		@job = Job.find(params[:id])
		@job.update(job_params)
		redirect_to @job

	end

	def search
		@jobs = Job.search(params).order("created_at DESC").page(params[:page]).per(25)
	end

	private

	def job_params
		params.require(:job).permit(:name, :description, :budget, :location, :open, :category_id, :skill_list, :awarded_proposal)
	end	
end
