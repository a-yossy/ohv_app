class Live < ApplicationRecord
  validates :place, presence: true
  validates :title, presence: true
  validates :detail, presence: true
  validates :open_hour, presence: true
  validates :start_hour, presence: true
  validates :advance_ticket_price, presence: true, numericality: { only_integer: true }
  validates :doors_ticket_price, presence: true, numericality: { only_integer: true }
  validates :start_time, presence: true
end
