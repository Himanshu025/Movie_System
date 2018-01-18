require 'rails_helper'
RSpec.describe ShowTime, type: :model do
	context "Show_Time Creation" do
		it 'has a valid factory' do
			show_time = FactoryGirl.create(:show_time).should be_valid
		end
	end

	context "Show_Time Validations" do
		it 'should be invalid without a start_time' do
			FactoryGirl.build(:show_time, start_time: nil).should_not be_valid
		end    
		it 'should be invalid without a end_time' do
			FactoryGirl.build(:show_time, end_time: nil).should_not be_valid
		end
		it 'should be valid start_time with length equals_to 7 ' do
			FactoryGirl.build(:show_time, start_time: "10:30am").should be_valid
		end
		it 'should be invalid start_time with length not_equals_to' do
			FactoryGirl.build(:show_time, start_time: "100:453am").should_not be_valid
		end
		it 'should be valid end_time with length equals_to 7 ' do
			FactoryGirl.build(:show_time, end_time: "12:30pm").should be_valid
		end
		it 'should be invalid end_time with length not_equals_to' do
			FactoryGirl.build(:show_time, end_time: "12112:453am").should_not be_valid
		end
	end
  
  context "Show_Time Associations" do
  	it 'should belongs to audi'do
		  audi = FactoryGirl.create(:audi)
		  show_time = FactoryGirl.create(:show_time ,audi_id:audi.id)
		  show_time.audi.id.should eq audi.id
	  end
  	it 'should_have many bookings'do
		  show_time = FactoryGirl.create(:show_time)
		  booking1 = FactoryGirl.create(:booking ,show_time_id:show_time.id)
		  booking2 = FactoryGirl.create(:booking ,show_time_id:show_time.id)
		  show_time.bookings.includes(booking1, booking2).should be_truthy
	  end 
  end
end