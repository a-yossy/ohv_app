# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    sequence(:name) { |i| "name#{i}" }
    sequence(:track_number) { |i| i }
    cd_id { create(:cd).id }
  end
end
