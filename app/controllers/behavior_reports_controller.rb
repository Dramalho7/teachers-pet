include SendGrid

class BehaviorReportsController < ApplicationController

	def new 
		@behaviorReport = BehaviorReport.new
	end

	def create
		@behaviorReport = BehaviorReport.create(date: params[:behavior_report][:date], report: params[:behavior_report][:report], student_id: params[:behavior_report][:student_id])
		@student = Student.find(params[:behavior_report][:student_id])
		@teacher = current_teacher.name

		from = Email.new(email: 'test@example.com')
		to = Email.new(email: @student.parent_email)
		subject = 'Guardian of' + ' ' + @student.name 
		content = Content.new(type: 'text/plain', value: 'There has been an incident at school today' + ' ' + @behaviorReport.report + ' ' + 'if you have any questions, please let me know. Sincerely,' + ' ' + @teacher)
		mail = SendGrid::Mail.new(from, subject, to, content)

		sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
		response = sg.client.mail._('send').post(request_body: mail.to_json)
		puts response.status_code
		puts response.body
		puts response.headers
		redirect_to student_path(@student.id)
	end

	def destroy
		@behavior = BehaviorReport.find(params[:id])
		@id = @behavior.student_id
		@student = Student.where(id: @id)
		@behavior.destroy
		redirect_to student_path(@student.ids)
	end

	def edit
	end

	def update
	end
end
