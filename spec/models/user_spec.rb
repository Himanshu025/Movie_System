require 'rails_helper'
RSpec.describe User, type: :model do
	context "User Creation" do
		it 'has a valid factory' do
			user = FactoryGirl.create(:user).should be_valid
		end
	end

  context "User Validation" do
		it 'is invalid without a name' do
			FactoryGirl.build(:user, name: nil).should_not be_valid
		end
		it 'is invalid without a location' do
			FactoryGirl.build(:user, location: nil).should_not be_valid
		end
		it 'is invalid without a email' do
			FactoryGirl.build(:user, email: nil).should_not be_valid
		end
		it 'is invalid without a phone number' do
			FactoryGirl.build(:user, phone: nil).should_not be_valid
		end 
		it "should be valid name with length greater_than_or_equal_to 3 " do
      FactoryGirl.build(:user, name: "abhishek").should be_valid
    end
    it "should be invalid name with length less_than_or_equal_to 2 " do
      FactoryGirl.build(:user, name: "ab").should_not be_valid
    end
    it "should be valid email with proper regular expression" do
      FactoryGirl.build(:user, email:"abc@gmail.com").should be_valid
    end
    it "should be invalid email with improper regular expression" do
      FactoryGirl.build(:user, email:"1^67abcd").should_not be_valid
    end
    it "should be valid phone_no with length greater_than_or_equal_to 7 and less_than_or_equal_to 12" do
      FactoryGirl.build(:user, phone: '9988779843').should be_valid
    end
    it "should be invalid phone_no with length less_than_or_equal_to 6 and greater_than_or_equal_to 13" do
      FactoryGirl.build(:user, phone: '09876').should_not be_valid
    end
	end

	context "User Associations" do
  	it 'should_have many bookings'do
		  user = FactoryGirl.create(:user)
		  movie = FactoryGirl.create(:movie)
      theatre = FactoryGirl.create(:theatre)
      audi = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
      show_time = FactoryGirl.create(:show_time, audi_id:audi.id)
		  booking1 = FactoryGirl.create(:booking ,user_id:user.id, show_time_id:show_time.id)
		  booking2 = FactoryGirl.create(:booking ,user_id:user.id, show_time_id:show_time.id)
		  user.bookings.includes(booking1,booking2).should be_truthy
	  end 	
	end
end