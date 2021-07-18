# frozen_string_literal: true

class CdFormObject
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveRecord::AttributeAssignment

  FORM_COUNT = 10

  attribute :format
  attribute :picture
  attribute :title
  attribute :release_date
  attribute :price
  attribute :url
  attribute :songs

  def execute
    save!
  end

  def save!
    ActiveRecord::Base.transaction do
      cd = Cd.new(format: format, picture: picture, title: title, release_date: release_date, price: price, url: url)
      cd.save!
      song = cd.songs.build(songs)
      song.save!
    end
    true
  rescue StandardError => e
    errors.add(:base, e.message.split(","))
    false
  end
end
