FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "bob#{n}" }
    name "bob"
    sequence(:email) { |n| "bob#{n}@example.com" }

    # Included the following functionality straight into the user model
    # after(:build) do |user|
    #   5.times do 
    #     user.items << FactoryGirl.create(:item, user: user)
    #   end
    # end
  end
end