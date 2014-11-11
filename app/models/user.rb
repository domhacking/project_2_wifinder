class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :profile_image
  # attr_accessible :title, :body

  mount_uploader :profile_image, ProfileImageUploader

  has_many :cafe_users
  has_many :cafes, through: :cafe_users

end

  