class ParentmailerMailer < ApplicationMailer
	  default :from => 'notifications@teachersassistant.net'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_status_email(user)

    @student = Student.find(params[:id])
    mail( :to => @student.parent_email, :subject => 'Status Email' )
    puts @student
  end
end