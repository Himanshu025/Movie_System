require 'faker'

FactoryGirl.define do
	factory :audi do
		category { Faker::Food.spice }
		capacity { Faker::Number.between(100, 500) }
		movie_id  1	
		theatre_id  1
	end
end
