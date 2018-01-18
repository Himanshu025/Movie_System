require 'faker'

FactoryGirl.define do
  factory :theatre do 
    name { Faker::DragonBall.character }
    category { Faker::GameOfThrones.house }
    location { Faker::Address.street_address }
  end
end
