class AddFlatpriceToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :price_per_hour, :integer
  end
end
