require 'faker'

FactoryGirl.define do
  factory :ticket do
    number { Faker::Number.number(5) }
    booking_id 1
  end
end
