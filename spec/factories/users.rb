FactoryBot.define do
  pw = "password"
  factory :user do
    sequence(:email){|n| "wolfgang.truong#{n}@factory.com" }
    password {pw}
    password_confirmation {pw}
    confirmed_at {Time.now}
  end
end
