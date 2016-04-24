class JobsController < ApplicationController
	def index
		@jobs = Job.all.order_list(params[:sort_by]).page(params[:page]).per(25)
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.save
		redirect_to @job
	end

	def edit
		@job = Job.find(params[:id])
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to :myjobs
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

	def myjobs
		@jobs = Job.where(user_id: current_user).order("created_at DESC")
	end

	def search
		if params[:category].blank? && params[:search].blank?
			@jobs = Job.all.order("created_at DESC").page(params[:page]).per(25)
		else
		@jobs = Job.search(params).order("created_at DESC").page(params[:page]).per(25)
		end
	end

	private

	def job_params
		params.require(:job).permit(:name, :description, :budget, :location, :open, :category_id, :skill_list, :awarded_proposal)
	end	
end
