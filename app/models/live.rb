class Live < ApplicationRecord
  validates :live_date, presence: true
  validates :place, presence: true
  validates :title, presence: true
  validates :detail, presence: true
  validates :open_hour, presence: true
  validates :start_hour, presence: true
  validates :adv_price, presence: true, numericality: { only_integer: true }
  validates :door_price, presence: true, numericality: { only_integer: true }
  validates :start_time, presence: true
end
