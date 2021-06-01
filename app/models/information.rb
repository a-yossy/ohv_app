class Information < ApplicationRecord
  default_scope -> { order(information_number: :desc) }
  validates :title, presence: true
  validates :picture, presence: true
  validates :information_date, presence: true
  validates :content, presence: true
  validates :information_number, presence: true, numericality: { only_integer: true }
end
