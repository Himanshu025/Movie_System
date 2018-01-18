class Movie < ActiveRecord::Base
	has_many :audis , dependent: :destroy
	has_many :theatres, through: :audis ,dependent: :destroy
	validates :title, presence: true
  validates :year, presence: true, numericality: { only_integer: true }, length: { minimum:2 ,maximum:4}
  validates :duration, presence: true
  validates :cast, presence: true
end