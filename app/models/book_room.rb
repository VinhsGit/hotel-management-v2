class BookRoom < ApplicationRecord
  belongs_to :room
  belongs_to :customer

  validates_presence_of :checkIn, :checkOut
end
