class User < ActiveRecord::Base
  self.primary_key = :uni
  validates :uni, uniqueness: true,  presence: true#ensure uni is not nil or blank #Ref:https://blog1.westagilelabs.com/rails-active-record-validations-part-2-68677fc0e8ab
  validates :uname, presence: true#ensure uname is not nil or blank
  validates :password, confirmation: true #ensure that the value passed in the password attribute matches the password_confirmation attribute
  validates :password_confirmation, presence: true #ensures that password_confirmation is present
  # validates :email, presence: true,
  #           format: { with: /\S+@\S+/ },
  #           uniqueness: { case_sensitive: false }

end
