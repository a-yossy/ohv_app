FactoryBot.define do
  factory :video do
    sequence(:title) { |i| "title#{i}" }
    sequence(:url) { |i| "https://www.google.co.jp/?client=safari&channel=mac_bm/#{i}" }
  end
end
