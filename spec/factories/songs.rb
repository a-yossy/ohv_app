FactoryBot.define do
  factory :song do
    sequence(:name) { |i| "format#{i}" }
    sequence(:track_number) { |i| i }
    cd_id { FactoryBot.create(:cd).id }
  end
end
