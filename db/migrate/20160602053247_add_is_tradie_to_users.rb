class AddIsTradieToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_tradie, :boolean
  end
end
