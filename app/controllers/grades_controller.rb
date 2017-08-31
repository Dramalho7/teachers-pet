class GradesController < ApplicationController

	def new 
		@grade = Grade.new
	end

	def create
		@students = Student.all
		@grade = Grade.create(date: params[:grade][:date], assignment: params[:grade][:assignment], score: params[:grade][:score], student_id: params[:grade][:student_id])
		@grade.save
		redirect_to student_path(params[:grade][:student_id])
	end

	def destroy
	end

	def show
	end

	def edit
		
	end

	def update
	end
	
end
