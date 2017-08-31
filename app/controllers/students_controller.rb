class StudentsController < ApplicationController
	
	def index
		@student = Student.all
		@course = Course.all
		@teachers = Teacher.all
	end 

	def new 
		@student = Student.new
		@students.avatar = params[:file]
	end

	def create
		@students = Student.create(name: params[:student][:name], parent_email: params[:student][:parent_email], avatar: params[:student][:avatar]);
		@students.save
		@students.id 
		redirect_to courses_path(current_teacher)
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
