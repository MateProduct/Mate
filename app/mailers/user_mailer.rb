class UserMailer < ActionMailer::Base
  default :from => 'saasmateproject@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def registration_confirmation(user)
    @user = user
    mail( :to => @user.lionmail,
          :subject => 'Registration Confirmation' )
  end
end
