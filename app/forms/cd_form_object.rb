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
  attribute :name
  attribute :track_number

  validates :format, presence: true
  validates :picture, presence: true
  validates :title, presence: true
  validates :release_date, presence: true
  validates :price, presence: true
  validates :url, presence: true
  validates :name, presence: true
  validates :track_number, presence: true

  def execute
    return false unless valid?

    save
  end

  def save
    ActiveRecord::Base.transaction do
      cd = Cd.new(format: format, picture: picture, title: title, release_date: release_date, price: price, url: url)
      cd.save
      song = cd.songs.build(name: name, track_number: track_number)
      song.save
    end
      return true
    rescue => e
      return false
  end
end
