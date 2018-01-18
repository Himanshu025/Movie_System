class User < ActiveRecord::Base
  has_many :bookings , dependent: :destroy
  validates :name , presence: true, length: { minimum: 3 }
  validates :location , presence: true
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :phone , presence: true, length: { minimum: 7, maximum: 12}
end