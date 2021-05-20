# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = Airport.create([
    { airport_code: "NQT", location_name: "Nottingham Airport" },
    { airport_code: "CBG", location_name: "Cambridge International Airport" },
    { airport_code: "LTN", location_name: "Luton Airport" },
    { airport_code: "NWI", location_name: "Norwich Airport" },
    { airport_code: "SEN", location_name: "London Southend Airport" },
    { airport_code: "STN", location_name: "Stansted Airport" },
    { airport_code: "LHR", location_name: "Heathrow Airport" },
    { airport_code: "LCY", location_name: "London City Airport" },
    { airport_code: "MAN", location_name: "Manchester Airport" },
    { airport_code: "LGW", location_name: "Gatwick Airport" },
    { airport_code: "BHX", location_name: "Birmingham Airport" },
    { airport_code: "LBA", location_name: "Leeds Bradford International Airport" }
])

airports.each do |origin_airport|
    airports.each do |destination_airport|
        unless origin_airport == destination_airport
            Flight.create(origin_id: origin_airport.id, destination_id: destination_airport.id, scheduled_time: Time.now + 1.hours)
            Flight.create(origin_id: origin_airport.id, destination_id: destination_airport.id, scheduled_time: Time.now + 3.hours)
            Flight.create(origin_id: origin_airport.id, destination_id: destination_airport.id, scheduled_time: Time.now + 5.hours)
            Flight.create(origin_id: origin_airport.id, destination_id: destination_airport.id, scheduled_time: Time.now + 7.hours)
            Flight.create(origin_id: origin_airport.id, destination_id: destination_airport.id, scheduled_time: Time.now + 9.hours)
            Flight.create(origin_id: origin_airport.id, destination_id: destination_airport.id, scheduled_time: Time.now + 11.hours)
        end
    end
end