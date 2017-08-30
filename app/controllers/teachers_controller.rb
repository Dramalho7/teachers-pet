class TeachersController < ApplicationController

	def index
		@teacher = Teacher.all
		@courses = Course.all
		
	end
 
	def new
		@teacher = Teacher.new
		@teachers.avatar = params[:file]
	end

	def create
		@teacher = Teacher.create(teacher_params)

		if @teacher.save
			redirect_to :back, notice: "Teacher has been created"
		else
			render :new
		end
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
