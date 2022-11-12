class User < ActiveRecord::Base
  self.primary_key = :uni
  def self.all_times
    ["Mon Morning", "Mon Afternoon", "Mon Evening", "Tues Morning", "Tues Afternoon", "Tues Evening",
     "Wed Morning", "Wed Afternoon", "Wed Evening", "Thur Morning", "Thur Afternoon", "Thur Evening",
     "Fri Morning", "Fri Afternoon", "Fri Evening", "Sat Morning", "Sat Afternoon", "Sat Evening",
     "Sun Morning", "Sun Afternoon", "Sun Evening"]
    # ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  end
  # has_secure_password
  def self.all_skills
    ["Ruby", "Java", "C++", "Python", "React", "Javascript", "HTML", "CSS", "Angular", "Excel", "Powerpoint"]
  end

  validates :uni, uniqueness: true,  presence: true#ensure uni is not nil or blank #Ref:https://blog1.westagilelabs.com/rails-active-record-validations-part-2-68677fc0e8ab
  validates :uname, presence: true#ensure uname is not nil or blank
  validates :password, confirmation: true,:on => :create #if: :password_required? #ensure that the value passed in the password attribute matches the password_confirmation attribute
  validates :password_confirmation, presence: true,:on => :create# if: :password_required? #ensures that password_confirmation is present iff password is typed in
  # validates :email, presence: true,
  #           format: { with: /\S+@\S+/ },
  #           uniqueness: { case_sensitive: false }
  # def enforce_password_validation
  #   @enforce_password_validation = true
  # end
  #
  # def dont_validate_password
  #   @enforce_password_validation = false
  # end
  #
  # private
  #
  # def password_required?
  #   @enforce_password_validation || password.present?
  # end

end
