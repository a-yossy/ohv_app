class Cd < ApplicationRecord
  has_many :songs
  default_scope -> { order(created_at: :desc) }
  validates :format, presence: true
  validates :picture, presence: true
  validates :title, presence: true
  validates :release_date, presence: true
  validates :price, presence: true
  validates :url, presence: true, length: { maximum: 2000 }
end
