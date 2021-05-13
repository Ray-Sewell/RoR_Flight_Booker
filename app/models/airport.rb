class Airport < ApplicationRecord
    has_many :departure_flights, class_name: "Flight", foreign_key: "origin_id"
    has_many :arrival_flights, class_name: "Flight", foreign_key: "destination_id"
end
