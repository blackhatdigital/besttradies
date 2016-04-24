class JobsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :search, :show]

	def index
		@jobs = Job.all.order_list(params[:sort_by]).page(params[:page]).per(25)
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.user = current_user
		if @job.save
		redirect_to @job
		else
			flash[:error] = @job.errors.full_messages.to_sentence
			render :new
		end
	end

	def edit
		@job = Job.find(params[:id])
		if current_user != @job.user
			flash[:error] = "You are not the owner of this job"
			redirect_to @job
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to :myjobs

		if current_user != @job.user
			flash[:error] = "You are not the owner of this job"
			redirect_to :myjobs
		end

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
		if current_user != @job.user
			flash[:error] = "You are not the owner of this job"
			redirect_to @job
		end
	end

	def myjobs
		@jobs = Job.where(user_id: current_user).order("created_at DESC")
	end


	def myawards
		@jobs = Job.where(award_user: current_user.id).order("created_at DESC")
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
		params.require(:job).permit(:name, :description, :budget, :location, :open, :category_id, :skill_list, :awarded_proposal, :award_user)
	end	
end
