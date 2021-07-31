# frozen_string_literal: true

FactoryBot.define do
  factory :cd do
    sequence(:format) { |i| "format#{i}" }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test.jpg")) }
    sequence(:title) { |i| "title#{i}" }
    sequence(:release_date) { |i| Date.current + i.days }
    sequence(:price) { |i| i }
    sequence(:url) { |i| "https://www.google.co.jp/?client=safari&channel=mac_bm/#{i}" }
  end
end
