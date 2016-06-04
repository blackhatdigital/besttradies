class JobsController < ApplicationController

before_action :authenticate_user!, :except => [:index]

	def index

		@jobs = Job.where(open: true).order_list(params[:sort_by]).page(params[:page]).per(25)
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.user = current_user
		@job.save
		redirect_to @job

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
		@jobs = Job.where(user_id: current_user, open: true).order("created_at DESC")
		@totaljobs = Job.where(user_id: current_user.id ).count

		@jobcount = Job.where(user_id: current_user, open: true).count
		@proposalreceived = Proposal.where(owner_id: current_user.id ).count

		
		@proposalopentotal = Job.joins(:proposals).where("jobs.open = ?", true).count 
		@proposalopen = Job.joins(:proposals).where("jobs.open = ?", true).where("jobs.user_id = ?", current_user.id).count

		@proposalcount = Proposal.where(user_id: current_user.id).count
		@jobawards = Job.where(award_user: current_user.id).count
		@winrate = @jobawards.to_f / @proposalcount * 100
	end

	def myclosedjobs
		@jobs = Job.where(user_id: current_user, open: false).order("created_at DESC")
	end

	def myawards
		@jobs = Job.where(award_user: current_user.id).order("created_at DESC")
	end

	def search
		@jobs = Job.search(params).page(params[:page]).per(25).where(open: true).order("created_at DESC")
	
	end

	private

	def job_params
		params.require(:job).permit(:name, :description, :budget, :location, :open, :category_id, :awarded_proposal, :award_user, :requirements, :end_date, :start_date, :price_per_hour)
	end	
end
