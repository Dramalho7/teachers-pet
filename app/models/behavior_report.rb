class BehaviorReport < ApplicationRecord
	belongs_to :students, required: true
end
