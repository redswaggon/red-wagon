FactoryGirl.define do
  factory :item do
    association :user
    name { Faker::Lorem.word }
  end
end