require 'faker'
FactoryGirl.define do
  factory :booking do
    seats_no "s2,s3"
    payment_method "Cash"
    user_id { FactoryGirl.create(:user).id }
    show_time_id { FactoryGirl.create(:show_time).id }
  end
end
