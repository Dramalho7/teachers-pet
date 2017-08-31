class ParticipationReportsController < ApplicationController
	def new 
		@participation = ParticipationReport.new
	end

	def create
		@participation = ParticipationReport.create(date: params[:participation_report][:date], report: params[:participation_report][:report], student_id: params[:participation_report][:student_id])
		@participation.save
		redirect_to student_path(params[:participation_report][:student_id])
	end
end
