class StudentsController < ApplicationController
	
	def index
		
	end 

	def new 
		
	end

	def create
		redirect_to courses_path(current_teacher)
	end

	def destroy
		@student = Student.find(params[:id])
		@course = Course.where({student_id: @student.id})
		@course.destroy_all
		@student.delete
		redirect_to teacher_path(current_teacher)
	end

	def show
		@teacher = Teacher.find(current_teacher.id)
		@student = Student.find(params[:id])
		@courses = Course.where(student_id: params[:id])
		@grades = Grade.all
		@participation = ParticipationReport.all
		@behavior = BehaviorReport.all
		@attendance = Attendance.all
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
