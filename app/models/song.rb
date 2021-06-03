class Song < ApplicationRecord
  scope :song_order, -> { order(track_number: :asc) }
  validates :name, presence: true
  validates :track_number, presence: true, numericality: { only_integer: true }
end
