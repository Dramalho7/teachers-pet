include SendGrid
class ParentsController < ApplicationController

	def show
		@student = Student.find(params[:id])
		@teacher = current_teacher
		@participation = ParticipationReport.where(student_id: params[:id])
		@behavior = BehaviorReport.where(student_id: params[:id])
		@grades = Grade.where(student_id: params[:id])
		@attendance = Attendance.where(student_id: params[:id])


		from = Email.new(email: 'test@example.com')
		to = Email.new(email: @student.parent_email)
		subject = 'Student Report'
		content = Content.new(type: 'text/html', value: '<html><body>some text here</body></html>')
		mail = SendGrid::Mail.new(from, subject, to, content)

		sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
		response = sg.client.mail._('send').post(request_body: mail.to_json)
		puts response.status_code
		puts response.body
		puts response.headers
		
		

	end

end
