class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms, foreign_key: "user_id"
  has_many :reservations, foreign_key: "user_id"
  mount_uploader :icon, UserImageUploader
end
