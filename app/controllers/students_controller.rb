class StudentsController < ApplicationController
	
	def index
		@student = Student.all
		@course = course.all
	end 

	def new 
		@student = Student.new
		@student.avatar = params[:file]
	end

	def create
		@current_user = current_user.id
		@student = Student.create(name: params[:student][:name], parents_email: params[:student][:parents_email]
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
