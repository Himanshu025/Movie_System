require 'faker'

FactoryGirl.define do
  factory :ticket do
    number { Faker::Number.number(5) }
    booking_id { FactoryGirl.create(:booking).id }
  end
end
