class ParticipationReport < ApplicationRecord
	belongs_to :students, required: true
end
