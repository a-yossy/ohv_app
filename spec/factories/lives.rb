FactoryBot.define do
  factory :live do
    sequence(:place) { |i| "place#{i}" }
    sequence(:title) { |i| "title#{i}" }
    sequence(:detail) { |i| "detail#{i}" }
    sequence(:open_hour) { |i| "open_hour#{i}" }
    sequence(:start_hour) { |i| "start_hour#{i}" }
    sequence(:advance_ticket_price) { |i| i }
    sequence(:doors_ticket_price) { |i| i }
    sequence(:start_time) { |i| DateTime.now + i.days }
  end
end
