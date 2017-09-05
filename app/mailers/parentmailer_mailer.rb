class ParentmailerMailer < ApplicationMailer
	  # default from: 'd'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_status_email(student)
  	
    @student = Student.find(student)
    mail(:to => @student.parent_email, :subject => 'Status Email' )
    
  end

end