class AddUserInfoToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :requirements, :text
    add_column :jobs, :timeframe, :integer
  end
end
