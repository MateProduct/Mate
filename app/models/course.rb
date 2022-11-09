class Course < ActiveRecord::Base
  #ensure every row is unique
  validates :uni, uniqueness: {scope: [:course_no, :section_no]}
  validates :uni, presence: true
  validates :course_no, presence: true
  validates :section_no, presence: true

end
