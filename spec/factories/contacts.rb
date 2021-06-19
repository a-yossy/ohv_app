# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    sequence(:name) { |i| "name#{i}" }
    sequence(:email) { |i| "email#{i}@example.com" }
    sequence(:content) { |i| "content#{i}" }
  end
end
