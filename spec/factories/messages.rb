FactoryGirl.define do
  factory :message do
    association :chat
    content { Faker::Lorem.sentence }
  end
end