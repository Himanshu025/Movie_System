require 'rails_helper'
RSpec.describe Theatre, type: :model do
  context "Theatre Creation" do
		it 'has a valid factory' do
			theatre = FactoryGirl.create(:theatre).should be_valid
		end
	end

	context "Theatre Validation" do
		it 'should be invalid without a name' do
			FactoryGirl.build(:theatre, name: nil).should_not be_valid
		end    
		it 'should be invalid without a theatre_type' do
			FactoryGirl.build(:theatre, category: nil).should_not be_valid
		end
		it 'should be invalid without a location' do
			FactoryGirl.build(:theatre, location: nil).should_not be_valid
		end
		it 'should be valid name with length greater_than_or_equal_to 3 ' do
			FactoryGirl.build(:theatre, name: "himanshu").should be_valid
		end
		it 'should be invalid name with length less_than_or_equal_to 2' do
			FactoryGirl.build(:theatre, name: "ab").should_not be_valid
		end
			it 'should be valid location with length greater_than_or_equal_to 3' do
			FactoryGirl.build(:theatre, location: "hiran magri").should be_valid
		end
		it 'should be invalid location with length less_than_or_equal_to 2' do
			FactoryGirl.build(:theatre, location: "ab").should_not be_valid
		end
	end
  
  context "Theatre Associations" do 
    theatre = FactoryGirl.create(:theatre)
    movie = FactoryGirl.create(:movie)
    it 'should have_many audis'do
      audi1 = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
      audi2 = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
      theatre.audis.includes(audi1, audi2).should be_truthy
    end
    it 'should have_many movies'do
      movie1 = FactoryGirl.create(:movie)
      movie2 = FactoryGirl.create(:movie)
      audi1 = FactoryGirl.create(:audi, movie_id:movie1.id ,theatre_id:theatre.id)
      audi2 = FactoryGirl.create(:audi, movie_id:movie2.id ,theatre_id:theatre.id)
      audi1.theatre.id.should eq theatre.id and audi1.movie.id.should eq movie1.id and audi2.movie.id.should eq movie2.id
    end
  end
end