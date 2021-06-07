# frozen_string_literal: true

class Live < ApplicationRecord
  validates :place, presence: true
  validates :title, presence: true
  validates :detail, presence: true
  validates :open_hour, presence: true
  validates :start_hour, presence: true
  validates :advance_ticket_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :doors_ticket_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :start_time, presence: true
end
