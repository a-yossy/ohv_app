# frozen_string_literal: true

class VideoFormObject
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :video_model
  attribute :url

  validates :video_model, presence: true
  validates :url, presence: true

  def execute
    return false unless valid?

    save
  end

  private

  def save
    video_model.url = url_for_youtube
    video_model.save
  end

  def url_for_youtube
    "https://www.youtube.com/embed/#{url.last(11)}"
  end
end

