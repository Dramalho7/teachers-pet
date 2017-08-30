class StudentsController < ApplicationController
	
	def index
		@student = Student.all
		@course = course.all
	end 

	def new 
		@student = Student.new
		@students.avatar = params[:file]
	end

	def create
		
		@student = Student.create(name: params[:student][:name], parents_email: params[:student][:parents_email], avatar: params[:student][:avatar]);
		redirect_to action: 'index'
	end

	def destroy
		@student = Student.find(params[:id])
		@course = Course.where({student_id: @student.id})
		@course.destroy_all
		@student.delete
		redirect_to action: 'index'
	end

	def show
		@teacher = Teacher.find(current_teacher.id)
		@student = Student.find(params[:id])
		@courses = Course.where(student_id: params[:id])
		@grades = Grade.where(student_id: params[:id])
		@participation = ParticipationReport.where(student_id: params[:id])
		@behavior = BehaviorReport.where(student_id: params[:id])
		@attendance = Attendance.where(student_id: params[:id])
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])
		@student.name = params[:student][:name]
		@student.save
		redirect_to action: 'index'
	end

end
