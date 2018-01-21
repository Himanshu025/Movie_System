require 'faker'

FactoryGirl.define do
  factory :booking do
    seats_no "s2,s3"
    payment_method "Cash"
    user_id 1
    show_time_id 1
  end
end
