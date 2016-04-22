class Skill < ActiveRecord::Base
	has_many :abilities
	has_many :jobs, through: :abilities
end
