# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!



#this probably doesn't do anything but i'll put it here just in case- Randall
  ActionMailer::Base.smtp_settings = {
  :user_name => 'dramalho7',
  :password => 'Troldan7',
  :domain => 'none.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}