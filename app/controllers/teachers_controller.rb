class TeachersController < ApplicationController
	
	def index
		@teacher = Teacher.all
		@courses = Course.all
	end

	def new
		@teacher = Teacher.new
		@teacher.avatar = params[:file]
	end

	def create
		@teacher = Teacher.create(user_params)

		if @teacher.save
			redirect_to :back, notice: "User has been created"
		else
			render :new
		end
	end

	def show
		@teacher = Teacher.find(params[:id])

		@courses = Course.where(teacher_id: @teacher.id).select(:name).distinct
		
		

		@students = Student.all
	end

	def destroy
		@teacher = current_teacher.id
		@courses = Course.where({teacher_id: @teacher.id})
		@courses.destroy_all
		@teacher.delete
	end
	
end
