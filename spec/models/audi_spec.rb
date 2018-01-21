require 'rails_helper'
RSpec.describe Audi, type: :model do
	context "Audi Creation" do
		it 'has a valid factory' do
			movie = FactoryGirl.create(:movie)
      theatre = FactoryGirl.create(:theatre)
      audi = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id).should be_valid
		end
	end

	context "Audi Validations" do
		it 'should be invalid without a category' do
			FactoryGirl.build(:audi, category: nil).should_not be_valid
		end    
		it 'should be invalid without a capacity' do
			FactoryGirl.build(:audi, capacity: nil).should_not be_valid
		end
		it 'should be valid capacity with length greater_than_or_equal_to 2 and less_than_or_equal_to 4 ' do
			FactoryGirl.build(:audi, capacity: '200').should be_valid
		end
		it 'should be invalid capacity with length less_than_or_equal_to 1 and greater_than_or_equal_to 5' do
			FactoryGirl.build(:audi, capacity: '1000000').should_not be_valid
		end
		it 'should be valid capacity with integer type numericality' do
			FactoryGirl.build(:movie, year: '2000').should be_valid
		end
		it 'should be invalid capacity without integer type numericality' do
			FactoryGirl.build(:movie, year: 'abccd').should_not be_valid
		end
	end

	context "Audi Associations" do
    movie = FactoryGirl.create(:movie)
    theatre = FactoryGirl.create(:theatre)
    audi = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id, movie_id:movie.id)
		it 'should belongs to theatre'do
		  audi.theatre.id.should eq theatre.id
	  end
	  it 'should belongs to movie'do
	    audi.movie.id.should eq movie.id
    end
    it 'should have_many show_times'do
      show_time1 = FactoryGirl.create(:show_time, audi_id:audi.id)
      show_time2 = FactoryGirl.create(:show_time, audi_id:audi.id)
      audi.show_times.includes(show_time1, show_time2).should be_truthy
    end
  end
end