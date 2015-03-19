class Student < ActiveRecord::Base
  belongs_to :teacher

  def assign
   teacher = Teacher.least_students
   student = self
   student.teacher = teacher
   student.save!
  end
end


