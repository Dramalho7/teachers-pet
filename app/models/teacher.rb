class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  has_many :courses
  has_many :students, :through => :courses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        
end
