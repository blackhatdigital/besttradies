class JobsController < ApplicationController
	def index
		@jobs = Job.all.order("created_at DESC")
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
	end

	private

	def job_params
		params.require(:job).permit(:name, :description, :budget, :location, :open)
	end	
end
