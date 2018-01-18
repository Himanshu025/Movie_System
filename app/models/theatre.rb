class Theatre < ActiveRecord::Base
	has_many :audis ,dependent: :destroy
	has_many :movies, through: :audis ,dependent: :destroy
	validates :name, presence: true, length: { minimum: 3 }
  validates :category, presence: true
  validates :location, presence: true, length: { minimum: 3 }
end