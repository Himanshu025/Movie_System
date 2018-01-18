class ShowTime < ActiveRecord::Base
  belongs_to :audi
  has_many :bookings , dependent: :destroy
  validates :start_time, presence: true 
  validates :end_time, presence:true 
end