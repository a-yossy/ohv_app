# frozen_string_literal: true

class CdFormObject
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveRecord::AttributeAssignment
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  attribute :format
  attribute :picture
  attribute :title
  attribute :release_date
  attribute :price
  attribute :url
  attribute :form_count
  attr_accessor :songs, :cd

  def initialize(attributes = {})
    super attributes
    self.cd = Cd.new()
    self.songs = 2.times.map { cd.songs.build() } unless self.songs.present?
  end

  def songs_attributes=(attributes)
    self.cd = Cd.new(format: format, picture: picture, title: title, release_date: release_date, price: price, url: url)
    self.songs = attributes.map { |_, v| cd.songs.build(v) }
  end

  def execute
    save!
  end

  def save!
    ActiveRecord::Base.transaction do
      cd.save!
      songs.map do |song|
        song.save!
      end
    end
    true
  rescue StandardError => e
    errors.add(:base, e.message.split(","))
    false
  end
end
