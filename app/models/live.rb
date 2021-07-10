# frozen_string_literal: true

class Live < ApplicationRecord
  scope :recently_held_live, -> { order(start_time: :desc) }
  validates :place, presence: true
  validates :title, presence: true
  validates :detail, presence: true
  validates :open_hour, presence: true
  validates :start_hour, presence: true
  validates :advance_ticket_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :doors_ticket_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :start_time, presence: true
  validate :open_hour_should_be_earlier_than_start_hour, if: %i[open_hour start_hour]

  private

  def open_hour_should_be_earlier_than_start_hour
    return if open_hour < start_hour

    errors.add(:start_hour, :should_be_earlier_than_open_hour)
  end
end
