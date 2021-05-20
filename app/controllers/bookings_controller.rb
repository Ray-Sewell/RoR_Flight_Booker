class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight])
        params[:passenger_count].to_i.times { @booking.passengers.build }
    end
    def create
        @flight = Flight.find(params[:flight])
        @booking = @flight.bookings.create(booking_params)
        if @booking.save
            redirect_to @booking, notice: "Booking created successfully"
        else
            flash[:alert] = "Failed to create booking, please check errors below"
            render :new
            flash[:alert] = nil
        end
    end
    def show
        @booking = Booking.find(params[:id])
        @flight = Flight.find(@booking.flight_id)
    end
    private
        def booking_params
            params.require(:booking).permit(passengers_attributes: %i[name email])
        end
end
