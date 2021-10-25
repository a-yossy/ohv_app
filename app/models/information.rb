# frozen_string_literal: true

class Information < ApplicationRecord
  scope :recently_announced_at, -> { order(announcement_date: :desc) }
  validates :title, presence: true
  validates :picture, presence: true
  validates :announcement_date, presence: true
  validates :content, presence: true
  validates :priority, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate  :picture_size, if: :picture

  private

  def picture_size
    return if picture.size <= 5.megabytes

    errors.add(:picture, :should_be_smaller_than_5MB)
  end
end
