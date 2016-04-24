class AddAwardUserToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :award_user, :integer
  end
end
