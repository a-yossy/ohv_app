class Cd < ApplicationRecord
  has_many :songs
  default_scope -> { order(created_at: :desc) }
end
