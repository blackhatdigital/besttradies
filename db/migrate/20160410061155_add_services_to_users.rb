class AddServicesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dob, :date
    add_column :users, :bio, :text
    add_column :users, :skills, :text
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :postcode, :integer
    add_column :users, :car, :boolean
    add_column :users, :equipment, :boolean
    add_column :users, :whitecard, :boolean
    add_column :users, :abn, :string
    add_column :users, :price, :decimal
  end
end
