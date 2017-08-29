class GradesController < ApplicationController

	def new 
		@current_user = current_user
		@planes = current_user.planes
		@job = Job.find(params[:job_id])
		@planeJob = PlaneJob.new
	end

	def create
		@planeJob = PlaneJob.create({job_id: params[:plane_job][:job_id], plane_id: params[:plane_job][:plane_id]})
		redirect_to controller: 'jobs', action:'index'
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
