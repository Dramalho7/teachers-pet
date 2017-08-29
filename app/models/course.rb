class Course < ApplicationRecord
	belongs_to :students
	belongs_to :teacher, required: true
end
