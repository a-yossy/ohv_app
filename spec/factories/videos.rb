FactoryBot.define do
  factory :video do
    sequence(:title) { |i| "title#{i}" }
    sequence(:url) { |i| "https://www.google.co.jp/?client=safari&channel=mac_bm/#{i}" }
    sequence(:release_date) { |i| Date.current + i.days }
  end
end
