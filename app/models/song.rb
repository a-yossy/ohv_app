class Song < ApplicationRecord
  validates :name, presence: true
  validates :track_number, presence: true, numericality: { only_integer: true }
  validates :cd_format, presence: true
end
