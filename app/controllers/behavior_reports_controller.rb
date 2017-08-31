class BehaviorReportsController < ApplicationController

	def new 
		@behaviorReport = BehaviorReport.new
	end

	def create
		@behaviorReport = BehaviorReport.create(date: params[:behavior_report][:date], report: params[:behavior_report][:report], student_id: params[:behavior_report][:student_id])
		@behaviorReport.save
		redirect_to student_path(params[:behavior_report][:student_id])
	end

	def destroy
	end

	def edit
	end

	def update
	end
end
