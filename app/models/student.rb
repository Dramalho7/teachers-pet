class Student < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	has_many :participation_reports
	has_many :grades
	has_many :attendances
	has_many :behavior_reports
	has_many :courses
	has_many :teachers, :through => :courses
	has_one :parent
end
