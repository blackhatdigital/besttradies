class Job < ActiveRecord::Base
	has_many :proposals
	belongs_to :category
	belongs_to :user
	has_many :abilities
	has_many :skills, through: :abilities

	geocoded_by :location
	after_validation :geocode

	def self.search(params)
		jobs = Job.where("name like ? or description like?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
		jobs
	end
end
