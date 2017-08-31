class CoursesController < ApplicationController
	
	def index
		@courses = Course.all
		

	end 

	def new  
		@course = Course.new
		@courses.avatar = params[:file]
		

	end

	def create
		@current_teacher = current_teacher.id
		@courses = Course.create(name: params[:course][:name], avatar: params[:course][:avatar], teacher_id: @current_teacher, student_id: params[:course][:student_id])
		@courses.save
		@courseid = Course.where(name: @courses.name)[0]
		if params[:course][:student_id] == nil
			redirect_to teacher_path(current_teacher)
		else 
			redirect_to course_path(@courseid)
		end
	end

	def destroy

		@course = Course.find(params[:id])
		@courseid = Course.where(name: @course.name)[0]
		@course.destroy
		redirect_to course_path(@courseid)
	end

	def show
		@coursesall = Course.all
		@course = Course.find(params[:id])
		@courseAddStudent = Course.find(params[:id])
		@courses = Course.where(name: @course.name)
		@allstudents = Student.all
		@studentIds = []
		@courses.each do |g|
			@studentIds.push(g.student_id)
		end
		@teacher = Teacher.find(current_teacher.id)
		@students = Student.where(id: @studentIds)
	end

	def edit
		@course = Course.find(params[:id])
		@courseAddStudent = Course.find(params[:id])
	end

	def update
		@courseAddStudent = Course.find(params[:id])
		@courseAddStudent.student_id = params[:course][:student_id]
		@course = Course.find(params[:id])
		@course.name = params[:course][:name]
		@courseAddStudent.save
		redirect_to course_path(params[:id])
	end

end
