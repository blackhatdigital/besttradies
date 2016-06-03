class AddOneLinerToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :one_liner, :string
    add_column :proposals, :hour_bid, :integer
  end
end
