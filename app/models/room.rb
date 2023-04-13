class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, foreign_key: "user_id"
end
