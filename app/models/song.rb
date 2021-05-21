class Song < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :track_number
    validates :cd_id
  end
end
