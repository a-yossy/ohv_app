class Information < ApplicationRecord
  scope :recently_announced_at, -> { order(announcement_date: :desc) }
  validates :title, presence: true
  validates :picture, presence: true
  validates :announcement_date, presence: true
  validates :content, presence: true
  validates :priority, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
