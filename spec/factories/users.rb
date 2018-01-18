require 'faker'

FactoryGirl.define do
  factory :user do 
    name { Faker::Name.name }
    location { Faker::Address.city }
    phone { Faker::Number.number(10) }
    email { Faker::Internet.email }
  end
end
