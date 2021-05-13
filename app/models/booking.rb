class Booking < ApplicationRecord
    belongs_to :flights
    has_many :passengers
end
