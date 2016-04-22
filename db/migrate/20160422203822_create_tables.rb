class CreateTables < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    		t.string :name
    		t.text :description
    		t.integer :budget
    		t.string :location
    		t.boolean :open, default: true
    		t.integer :awarded_proposal
    		t.timestamps
    	end

    	create_table :categories do |t|
    		t.string :name
    	end

    	create_table :skills do |t|
    		t.string :name
    	end

    	create_table :proposals do |t|
    		t.integer :bid
    		t.text :description
    		t.timestamps
    	end

    	create_table :abilities do |t|
    	end

    	add_reference :jobs, :category, index: true
    	add_reference :proposals, :job, index: true
    	add_reference :abilities, :job, index: true
    	add_reference :abilities, :skill, index: true
  end
end
