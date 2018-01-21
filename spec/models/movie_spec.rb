require 'rails_helper'
RSpec.describe Movie, type: :model do
	context "Movie Creation" do
		it 'has a valid factory' do
			movie = FactoryGirl.create(:movie).should be_valid
		end
	end

	context "Movie Validation" do
		it 'should be invalid without a title' do
			FactoryGirl.build(:movie, title: nil).should_not be_valid
		end    
		it 'should be invalid without a year' do
			FactoryGirl.build(:movie, year: nil).should_not be_valid
		end
		it 'should be invalid without a duration' do
			FactoryGirl.build(:movie, duration: nil).should_not be_valid
		end
		it 'should be invalid without a cast' do
			FactoryGirl.build(:movie, cast: nil).should_not be_valid
		end 
		it 'should be valid year with length less_than_or_equal_to 4 ' do
			FactoryGirl.build(:movie, year: '1995').should be_valid
		end
		it 'should be invalid year with length greater_than 5' do
			FactoryGirl.build(:movie, year: '2000000').should_not be_valid
		end
		it 'should be invalid year without integer type numericality' do
			FactoryGirl.build(:movie, year: 'abccd').should_not be_valid
		end
		it 'should be valid year with integer type numericality' do
			FactoryGirl.build(:movie, year: '1995').should be_valid
		end
	end

	context "Movie Associations" do
		movie = FactoryGirl.create(:movie)
    theatre = FactoryGirl.create(:theatre) 
    it 'should have_many audis'do
      audi1 = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
      audi2 = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
      movie.audis.includes(audi1, audi2).should be_truthy
    end
    it 'should have_many theatres'do
      theatre1 = FactoryGirl.create(:theatre)
      theatre2 = FactoryGirl.create(:theatre)
      audi1 = FactoryGirl.create(:audi, movie_id:movie.id ,theatre_id:theatre1.id)
      audi2 = FactoryGirl.create(:audi, movie_id:movie.id ,theatre_id:theatre2.id)
      audi1.movie.id.should eq movie.id and audi1.theatre.id.should eq theatre1.id and audi2.theatre.id.should eq theatre2.id
    end
	end
end