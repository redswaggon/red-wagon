FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "bob#{n}" }
    name "bob"
    sequence(:email) { |n| "bob#{n}@example.com" }
  end
end