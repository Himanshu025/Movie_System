require 'rails_helper'
RSpec.describe ShowTime, type: :model do
	context "Show_Time Creation" do
		it 'has a valid factory' do
			movie = FactoryGirl.create(:movie)
      theatre = FactoryGirl.create(:theatre)
      audi = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
      show_time = FactoryGirl.create(:show_time, audi_id:audi.id).should be_valid
		end
	end

	context "Show_Time Validations" do
		it 'should be invalid without a start_time' do
			FactoryGirl.build(:show_time, start_time: nil).should_not be_valid
		end    
		it 'should be invalid without a end_time' do
			FactoryGirl.build(:show_time, end_time: nil).should_not be_valid
		end
		it 'should be a valid start_time format' do
      FactoryGirl.build(:show_time, start_time: "03:55:10").should be_valid
		end
		it 'should be a valid end_time format' do
      FactoryGirl.build(:show_time, end_time: "03:55:10").should be_valid
		end
	end
  
  context "Show_Time Associations" do
    movie = FactoryGirl.create(:movie)
    theatre = FactoryGirl.create(:theatre)
    audi = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
    show_time = FactoryGirl.create(:show_time, audi_id:audi.id)
  	it 'should belongs to audi'do
		  show_time.audi.id.should eq audi.id
	  end
  	it 'should_have many bookings'do
  	  user = FactoryGirl.create(:user)
		  booking1 = FactoryGirl.create(:booking ,user_id:user.id ,show_time_id:show_time.id)
		  booking2 = FactoryGirl.create(:booking ,user_id:user.id ,show_time_id:show_time.id)
		  show_time.bookings.includes(booking1, booking2).should be_truthy
	  end 
  end
end