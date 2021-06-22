# frozen_string_literal: true

class Video < ApplicationRecord
  scope :recently_released_at, -> { order(release_date: :desc) }
  validates :title, presence: true
  validates :url, presence: true, length: { maximum: 2000 }
  validates :release_date, presence: true
end
