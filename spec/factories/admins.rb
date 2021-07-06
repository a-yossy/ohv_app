FactoryBot.define do
  factory :admin do
    email { ENV["TOMAIL"] }
    password { ENV["ADMIN_PASSWORD"] }
  end
end
