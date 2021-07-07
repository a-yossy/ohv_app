# frozen_string_literal: true

FactoryBot.define do
  factory :information do
    sequence(:title) { |i| "title#{i}" }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test.jpg")) }
    sequence(:announcement_date) { |i| Date.current + i.days }
    sequence(:content) { |i| "content#{i}" }
    priority { 0 }
  end
end
