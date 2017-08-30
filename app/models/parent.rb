class Parent < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	belongs_to :student
end
