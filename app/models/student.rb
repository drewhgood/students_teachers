class Student < ActiveRecord::Base
  has_many :students_teachers
  has_many :teachers, through: :students_teachers

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, uniqueness: true

  validate :not_toddler

  def not_toddler

    errors.add(:birthday, "can't be a toddler") if birthday >= (Date.today  - 3.years)
  end


  def assign
    teacher = Teacher.least_students
    student = self

    join = StudentsTeacher.create
    join.student_id = student.id
    join.teacher_id = teacher.id
    join.save!
  end

  def age
    dob = self.birthday
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end
end


 # :class_name => "StudentsTeachers"