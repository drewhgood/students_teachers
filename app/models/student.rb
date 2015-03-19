class Student < ActiveRecord::Base
  has_many :students_teachers
  has_many :teachers, through: :students_teachers

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates age, numericality: { only_integer: true, great_than_equal_to Date.today - 3.years }
  validates :email, uniqueness: true


  def assign
    teacher = Teacher.least_students
    student = self

    join = StudentsTeacher.create
    join.student_id = student.id
    join.teacher_id = teacher.id
    join.save!
  end

  def age
    dob = self.birthdate
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end
end


 # :class_name => "StudentsTeachers"