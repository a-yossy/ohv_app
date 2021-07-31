# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    sequence(:name) { |i| "name#{i}" }
    sequence(:track_number) { |i| i }
    association :cd_id
  end
end
