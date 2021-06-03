class Information < ApplicationRecord
  default_scope -> { order(announcement_date: :desc) }
  validates :title, presence: true
  validates :picture, presence: true
  validates :announcement_date, presence: true
  validates :content, presence: true
  validates :priority, presence: true, numericality: { only_integer: true }
end
