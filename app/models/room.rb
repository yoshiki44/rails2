class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, foreign_key: "room_id"

  def self.ransackable_associations(auth_object = nil)
  ["reservations", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "detail", "id", "introduction", "name", "price", "updated_at", "user_id", "reservations", "user"]
  end

  mount_uploader :room_icon, RoomImageUploader

  validates :name, presence: true
  validates :price, presence: true, numericality: {only_integer: true}
  validates :address, presence: true
  validates :detail, presence: true


end
