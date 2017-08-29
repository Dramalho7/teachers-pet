class Attendance < ApplicationRecord
	belongs_to :students, required: true
end
