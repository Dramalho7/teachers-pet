class ParentmailerMailer < ApplicationMailer
	  default :from => 'notifications@teachersassistant.edu'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_status_email(user)

    @student = user
    puts @student
    puts "HEY, IM OVER HERE"
    mail( :to => @student.parent_email, :subject => 'Status Email' )

  end

end