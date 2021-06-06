# frozen_string_literal: true

FactoryBot.define do
  factory :information do
    sequence(:title) { |i| "title#{i}" }
    sequence(:picture) { |i| "picture#{i}.jpg" }
    sequence(:announcement_date) { |i| Date.current + i.days }
    sequence(:content) { |i| "content#{i}" }
    priority { 0 }
  end
end
