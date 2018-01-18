class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :show_time
	has_many :tickets ,dependent: :destroy
	validates :seats_no, presence: true
	validates :payment_method, presence: true
end