class AddReferenceOfUsers < ActiveRecord::Migration
  def change
  	add_reference :jobs, :user, index: true
  	add_reference :proposals, :user, index: true
  end
end
