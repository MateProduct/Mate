# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Rottenpotatoes::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
  :password => 'PUT IN API Key', # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'w4152-mate.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
