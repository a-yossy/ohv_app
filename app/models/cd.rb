# frozen_string_literal: true

class Cd < ApplicationRecord
  has_many :songs, dependent: :destroy
  scope :recently_released_at, -> { order(release_date: :desc) }
  validates :format, presence: true
  validates :picture, presence: true
  validates :title, presence: true
  validates :release_date, presence: true
  validates :price, presence: true
  validates :url, presence: true, length: { maximum: 2000 }
end
