class Student < ActiveRecord::Base
  has_many :students_teachers
  has_many :teachers, through: :students_teachers

  def assign
   teacher = Teacher.least_students
   student = self
   student.teacher = teacher
   student.save!
  end
end


 # :class_name => "StudentsTeachers"