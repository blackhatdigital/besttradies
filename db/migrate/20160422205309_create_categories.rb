class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :proposal
      t.string :skill

      t.timestamps null: false
    end
  end
end
