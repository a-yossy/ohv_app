# frozen_string_literal: true

class Information < ApplicationRecord
  scope :recently_announced_at, -> { order(announcement_date: :desc) }
  mount_uploader :picture, PictureUploader
  validates :title, presence: true
  validates :picture, presence: true
  validates :announcement_date, presence: true
  validates :content, presence: true
  validates :priority, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate  :picture_size, if: :picture

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "Pictureは5MBより小さくして下さい")
    end
  end
end
