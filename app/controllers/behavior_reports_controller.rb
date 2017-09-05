class BehaviorReportsController < ApplicationController

	def new 
		@behaviorReport = BehaviorReport.new
	end

	def create
		@behaviorReport = BehaviorReport.create(date: params[:behavior_report][:date], report: params[:behavior_report][:report], student_id: params[:behavior_report][:student_id])
		@behaviorReport.save
		redirect_to student_path(params[:behavior_report][:student_id])

		respond_to do |format|
      	if @behaviorReport.save
        # Tell the UserMailer to send a welcome email after save
        	ParentmailerMailer.send_status_email(@students).deliver
 
        	format.html {redirect_to student_path(params[:behavior_report][:student_id]), notice: 'Behavior Report Sent'}
        	format.json {redirect_to student_path(params[:behavior_report][:student_id]), status: :created }
      	else
        	format.html { render action: 'new' }
       		format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@behavior = BehaviorReport.find(params[:id])
		@id = @behavior.student_id
		@student = Student.where(id: @id)
		@behavior.destroy
		redirect_to student_path(@student.ids)
	end

	def edit
	end

	def update
	end
end
