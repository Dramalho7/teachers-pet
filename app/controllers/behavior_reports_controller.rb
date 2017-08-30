class BehaviorReportsController < ApplicationController

	def index
	end

	def new
		@behaviorReport = BehaviorReport.new
		@student = Student.all
	end

	def create
		@behaviorReport = BehaviorReport.create()
	new

	def destroy
	end

	def edit
	end

	def update
	end
end
