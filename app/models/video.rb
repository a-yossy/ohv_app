class Video < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, length: { maximum: 2000 }
end
