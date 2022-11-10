class Course < ActiveRecord::Base
  #ensure every row is unique
  # add error message if not unique
  validates :course_no, uniqueness: {scope: [:uni, :section_no ], message: "already exists."}
  validates :uni, presence: true
  validates :course_no, presence: true
  validates :section_no, presence: true

end
