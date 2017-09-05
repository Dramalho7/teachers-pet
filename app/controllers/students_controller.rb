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
		@grades = Grade.where(student_id: params[:id])
		Groupdate.dates = false
		# grades logic
		@gradesTotal = 0.0
		# @grades.each do |g|
		# 	@gradesTotal = @gradesTotal + Integer(g.score)
		# 	puts @gradeTotal
 	# 	end
 		if @grades.length > 0
 			(@gradesAvg = (@gradesTotal / (@grades.length))).round(2)
 		else
 		end
		# participation grade logic
		@participationTotal = 0.00
		@participation = ParticipationReport.where(student_id: params[:id])
		@participation.each do |g|
			@participationTotal = (@participationTotal + Integer(g.report))
		end
		if @participation.length > 0
			(@participationAvg = (@participationTotal / (@participation.length ) )).round(2)
		else
		end
		@behavior = BehaviorReport.where(student_id: params[:id])
		@attendance = Attendance.where(student_id: params[:id])
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])

		@student.update_attributes(name: params[:student][:name], parent_email: params[:student][:parent_email])
		@student.save

		redirect_to @student

	end

end
