class AttendancesController < ApplicationController
	def new 
		@attendance = Attendance.new
	end

	def create
		@attendance = Attendance.create(date: params[:attendance][:date], is_present: params[:attendance][:is_present], student_id: params[:attendance][:student_id])
		@attendance.save
		redirect_to student_path(params[:attendance][:student_id])
	end
end
