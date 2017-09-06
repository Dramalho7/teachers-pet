include SendGrid
class ParentsController < ApplicationController

	def show
		@student = Student.find(params[:id])
		@teacher = current_teacher
		@participation = ParticipationReport.where(student_id: params[:id])
		@behavior = BehaviorReport.where(student_id: params[:id])
		@grades = Grade.where(student_id: params[:id])
		@attendance = Attendance.where(student_id: params[:id])
		@attendancearray = []
		@attendance.each do |g|
			@attendancearray.push(g.is_present)
		end
		@gradesTotal = 0.00
		@grades.each do |g|
			@gradesTotal = @gradesTotal + Integer(g.score)
			puts @gradeTotal
 		end
 		if @grades.length > 0
 			(@gradesAvg = (@gradesTotal / (@grades.length))).round(2)
 		else
 			@gradesAvg = 'No grades yet assigned'
 		end

 		@participationTotal = 0.00
		@participation = ParticipationReport.where(student_id: params[:id])
		@participation.each do |g|
			@participationTotal = (@participationTotal + Integer(g.report))
		end
		if @participation.length > 0
			(@participationAvg = (@participationTotal / (@participation.length ) )).round(2)
		else
		end

		@behavior = BehaviorReport.where(student_id: params[:id])
		@attendance = Attendance.where(student_id: params[:id])
		from = Email.new(email: @teacher.email)
		subject = 'Student Report'
		to = Email.new(email: @student.parent_email)
		content = Content.new(type: 'text/html', value: '<html><body><p>Dear Guardian of <%=@student.name%>,<p>
			<p>I am sending you an update of how <%=@student.name%> is doing in my class. Currently, <%=@student.name%> has an average of <%=@gradesAvg%>. <%=@student.name%> also has a participation average of <%=@participationAvg%> out of 5.</p> <p> <%=@student.name%>s last 5 behavioral notes: <%=@BehaviorReport.each%> | </p> <p><%=@student.name%> has been absent <%=@attendancearray.length%> </p> <body></html>')
		mail = Mail.new(from, subject, to, content)
		puts content
		 sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'], host: 'https://api.sendgrid.com')
		response = sg.client.mail._('send').post(request_body: mail.to_json)
		puts response.status_code
		puts ENV['SENDGRID_API_KEY']
		puts response.body
		puts response.headers
		redirect_to student_path(@student.id)

	end
	def index

	end
end

