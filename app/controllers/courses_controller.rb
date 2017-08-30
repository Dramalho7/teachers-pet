class CoursesController < ApplicationController
	
	def index
		@courses = Course.all
	end 

	def new 
		@course = Course.new
		@course.avatar = params[:file]
	end

	def create
		@current_teacher = current_teacher.id
		@course = Course.create(name: params[:course][:name], avatar: params[:plane][:avatar], teacher_id: @current_teacher)
		redirect_to action:'index'
	end

	def destroy
		@course = Plane.find(params[:id])
		@course.delete
		redirect_to action:'index'
	end

	def show
		# will get page with students their pics and names
		@course = Course.find(params[:id])
		@courses = Course.where(name: @course.name)
		@studentIds = []
		@courses.each do |g|
			@studentIds.push(g.student_id)
		end
		@teacher = Teacher.find(current_teacher.id)
		@students = Student.where(id: @studentIds)
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		@course.name = params[:plane][:name]
		@planes.save
		redirect_to :action => 'index'
	end

end
