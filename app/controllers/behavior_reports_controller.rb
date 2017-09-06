include SendGrid

class BehaviorReportsController < ApplicationController

	def new 
		@behaviorReport = BehaviorReport.new
	end

	def create
		@behaviorReport = BehaviorReport.create(date: params[:behavior_report][:date], report: params[:behavior_report][:report], student_id: params[:behavior_report][:student_id])
		@student = Student.find(params[:behavior_report][:student_id])
		@teacher = current_teacher.name
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
