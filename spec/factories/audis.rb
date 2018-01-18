require 'faker'

FactoryGirl.define do
	factory :audi do
		category { Faker::Food.spice }
		capacity { Faker::Number.between(100, 500) }
		movie_id  { FactoryGirl.create(:movie).id }
		theatre_id  { FactoryGirl.create(:theatre).id }
	end
end
