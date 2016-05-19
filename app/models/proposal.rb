class Proposal < ActiveRecord::Base

	include PublicActivity::Common
	tracked owner: Proc.new{ |controller, model| controller.current_user }
	
	belongs_to :job
	belongs_to :user
end
