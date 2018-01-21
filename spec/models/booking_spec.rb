require 'rails_helper'
RSpec.describe Booking, type: :model do
	context "Booking Creation" do
		it 'has a valid factory' do
      user = FactoryGirl.create(:user)
      movie = FactoryGirl.create(:movie)
      theatre = FactoryGirl.create(:theatre)
      audi = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
      show_time = FactoryGirl.create(:show_time, audi_id:audi.id)
      booking = FactoryGirl.create(:booking,user_id:user.id, show_time_id:show_time.id).should be_valid
		end
	end

	context "Booking Validation" do
		it 'should be invalid without a seats_no' do
			FactoryGirl.build(:booking, seats_no: nil).should_not be_valid
		end    
		it 'should be invalid without a payment_method' do
			FactoryGirl.build(:booking, payment_method: nil).should_not be_valid
		end
	end

	context "Booking Associations" do
    user = FactoryGirl.create(:user)
    movie = FactoryGirl.create(:movie)
    theatre = FactoryGirl.create(:theatre)
    audi = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
    show_time = FactoryGirl.create(:show_time, audi_id:audi.id)
    booking = FactoryGirl.create(:booking,user_id:user.id, show_time_id:show_time.id)
		it 'should belongs to user'do
		  booking.user.id.should eq user.id
	  end
		it 'should belongs to show_time'do
		  booking.show_time.id.should eq show_time.id
	  end
	  it 'should have_many tickets'do
      ticket1 = FactoryGirl.create(:ticket, booking_id:booking.id)
      ticket2 = FactoryGirl.create(:ticket, booking_id:booking.id)
      booking.tickets.includes(ticket1 , ticket2).should be_truthy
    end
  end  
end