require 'faker'

FactoryGirl.define do
  factory :show_time do
    start_time { Faker::Time.between(2.days.ago, Date.today, :all).strftime("%T") }
    end_time { Faker::Time.between(2.days.ago, Date.today, :all).strftime("%T") }
    audi_id 1
  end
end
