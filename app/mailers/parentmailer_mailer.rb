class ParentmailerMailer < ApplicationMailer
	  default :from => @teacher.email

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def notify_parent(user)
    @student = student.find(params[:id])
    mail( :to => @student.parent_email,
    :subject => 'Status Email' )
  end
end