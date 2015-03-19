require_relative '../../config'

class CreateTeachers < ActiveRecord::Migration
  
  def up
    # Code to create the table here:
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.timestamps
    end
  end

  def down
    remove_column :teachers,  :name
    remove_column :teachers,  :email
    remove_column :teachers,  :phone
    remove_column :teachers,  :address
    remove_column :teachers, :timestamps
    
    drop_table :teachers
  end
  
end