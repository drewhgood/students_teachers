require_relative '../../config'

class CreateManyToMany < ActiveRecord::Migration
  
  def up
    #remove existing relationship
    remove_column :students, :teacher_id

    create_table :students_teachers do |t|
      t.integer :teacher_id
      t.integer :student_id
    end   
  end

  def down
    add_column :students, :teacher_id
    drop_table :students_teachers
  end

end