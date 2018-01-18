require 'faker'

FactoryGirl.define do
  factory :movie do 
    title { Faker::App.name }
    year { Faker::Time.between(2.days.ago, Date.today, :all).strftime("%G") }
    duration { Faker::Time.between(2.days.ago, Date.today, :all).strftime("%T") }
    cast { Faker::Name.name_with_middle }
  end
end
