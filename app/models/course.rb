class Course < ApplicationRecord
	# belongs_to :students
	# belongs_to :teachers
	mount_uploader :avatar, AvatarUploader
end
