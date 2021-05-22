class Cd < ApplicationRecord
  has_many :songs
  validates :format, presence: true
  validates :picture, presence: true
  validates :title, presence: true
  validates :release_date, presence: true
  validates :picture, presence: true
  validates :url, presence: true, length: { maximum: 2000 }
end
