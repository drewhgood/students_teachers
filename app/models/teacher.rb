class Teacher < ActiveRecord::Base
  has_many :students_teachers
  has_many :students, through: :students_teachers
  validates :email, uniqueness: true


  def self.least_students
    teachers = Teacher.all
    asignee = Teacher.first

    teachers.each do |teacher|
      asignee = teacher if teacher.students.count <= asignee.students.count 
    end

    asignee
  end


end

# :class_name => "StudentsTeachers"