FactoryGirl.define do
  factory :user do
    password = 'pomplar'

    first_name              { Faker::Name.first_name }
    last_name               { Faker::Name.last_name }
    sequence(:email)        { |n| "pompier#{n}@exemple.com" }
    password                password
    password_confirmation   password
    cis                     { Faker::Address.city }
    rank                    { Rank.const_get(:RANKS).keys.sample }

    trait :admin do
      is_admin true
    end
  end
end
