class Ticket < ActiveRecord::Base
  belongs_to :booking
  validates :number, presence: true, length: { minimum:2, maximum:7}, numericality: { only_integer: true }
end