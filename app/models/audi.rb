class Audi < ActiveRecord::Base
  belongs_to :movie
  belongs_to :theatre
  has_many :show_times , dependent: :destroy
  validates :category, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }, length: { minimum:2, maximum:4}
end
