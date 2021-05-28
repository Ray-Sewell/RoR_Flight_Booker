class PassengerMailer < ApplicationMailer
    default from: 'bookings@flightbooker.com'

    def booking_confirmation
        @booking = Booking.find(params[:booking_id])
        @flight = Flight.find(@booking.flight_id)
        @passenger = Passenger.find(params[:passenger_id])
        mail(to: @passenger.email, subject: "Your flight booking has been confirmed")
    end
end
