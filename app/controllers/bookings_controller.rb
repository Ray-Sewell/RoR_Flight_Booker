class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @passengers = @booking.passengers.build
        @flight = Flight.find(params[:flight])
    end
    def create
        @flight = Flight.find(params[:flight_id])
        @booking = @flight.bookings.create(booking_params)
        if @booking.save
            redirect_to @booking
        else
            render :new
        end
    end
    def show
    end
    private
        def booking_params
            params.require(:booking).permit(passengers_attributes: %i[name email])
        end
end
