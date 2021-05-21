class Cd < ApplicationRecord
  has_many :songs
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :format
    validates :title
    validates :release_date
    validates :price
    validates :url
    validates :picture
  end
end
