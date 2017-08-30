class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :avatar, AvatarUploader
   validates_integrity_of  :avatar
  validates_processing_of :avatar
  has_many :courses
  has_many :students, :through => :courses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
end
