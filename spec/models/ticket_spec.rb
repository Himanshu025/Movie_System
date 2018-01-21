require 'rails_helper'
RSpec.describe Ticket, type: :model do
	context "Ticket Creation" do
		it 'has a valid factory' do
			user = FactoryGirl.create(:user)
      movie = FactoryGirl.create(:movie)
      theatre = FactoryGirl.create(:theatre)
      audi = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
      show_time = FactoryGirl.create(:show_time, audi_id:audi.id)
      booking = FactoryGirl.create(:booking,user_id:user.id, show_time_id:show_time.id) 
      ticket = FactoryGirl.create(:ticket, booking_id:booking.id).should be_valid
		end
	end

	context "Ticket Validations" do
		it 'should be invalid without a trans_no' do
			FactoryGirl.build(:ticket, number: nil).should_not be_valid
		end    
		it 'should be valid trans_no with length less_than_or_equal_to 7 and greater_than_equal_to 2' do
			FactoryGirl.build(:ticket, number: '65287').should be_valid
		end
		it 'should be invalid trans_no with length less_than_or_equal_to 1 and greater_than_equal_to 8' do
			FactoryGirl.build(:ticket, number: '652870987654').should_not be_valid
		end
		it 'should be invalid trans_no without integer type numericality' do
			FactoryGirl.build(:ticket, number: 'abcdd').should_not be_valid
		end
		it 'should be valid trans_no with integer type numericality' do
			FactoryGirl.build(:ticket, number: '12345').should be_valid
		end
	end

	context "Ticket Associations" do
  	it 'should belongs to booking'do
  	  user = FactoryGirl.create(:user)
      movie = FactoryGirl.create(:movie)
      theatre = FactoryGirl.create(:theatre)
      audi = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
      show_time = FactoryGirl.create(:show_time, audi_id:audi.id)
      booking = FactoryGirl.create(:booking,user_id:user.id, show_time_id:show_time.id) 
      ticket = FactoryGirl.create(:ticket, booking_id:booking.id)
		  ticket.booking.id.should eq booking.id
	  end 	
	end
end