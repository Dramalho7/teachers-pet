class TeachersController < ApplicationController

	def index
		@teacher = Teacher.all
		@courses = Course.all
		 
	end
 
	def new
		
	end

	def create
	
	end

	def show
		@teacher = Teacher.find(params[:id])

		@course = Course.where(teacher_id: @teacher.id).select(:name).distinct
		@courses = Course.all
		
		


		@students = Student.all
	end

	def destroy
		@teacher = current_teacher.id
		@courses = Course.where({teacher_id: @teacher.id})
		@courses.destroy_all
		@teacher.delete
	end

end
