require 'rails_helper'
RSpec.describe Booking, type: :model do
	context "Booking Creation" do
		it 'has a valid factory' do
			booking = FactoryGirl.create(:booking).should be_valid
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
		it 'should belongs to user'do
		  user = FactoryGirl.create(:user)
		  booking = FactoryGirl.create(:booking ,user_id:user.id)
		  booking.user.id.should eq user.id
	  end
		it 'should belongs to show_time'do
		  show_time = FactoryGirl.create(:show_time)
		  booking = FactoryGirl.create(:booking ,show_time_id:show_time.id)
		  booking.show_time.id.should eq show_time.id
	  end
	  it 'should have_many tickets'do
      booking = FactoryGirl.create(:booking)
      ticket1 = FactoryGirl.create(:ticket, booking_id:booking.id)
      ticket2 = FactoryGirl.create(:ticket, booking_id:booking.id)
      booking.tickets.includes(ticket1 , ticket2).should be_truthy
    end
  end  
end