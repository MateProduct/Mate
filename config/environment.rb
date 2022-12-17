# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Rottenpotatoes::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
  :password => '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', # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
