class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in,
    presence: true

  validates :check_out,
    presence: true

  validate :check_out_check

  def check_out_check
    unless self.check_in.nil? || self.check_out.nil?
      errors.add(:check_out,"はチェックインより前の日付は登録できません。") if self.check_in >= self.check_out
    end
  end
end
