class Grade < ApplicationRecord
	belongs_to :students, required: true
end
