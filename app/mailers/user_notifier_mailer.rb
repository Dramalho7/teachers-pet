#Ignore this, this is a test, in fact, ignore anything starting with "user"

class UserNotifierMailer < ApplicationMailer
	  default :from => 'notificationsystem@teachersassistant.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email, :subject => 'Thanks for signing up for our amazing app' )
  end
end