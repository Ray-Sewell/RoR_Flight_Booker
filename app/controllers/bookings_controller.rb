class BookingsController < ApplicationController
    def new
        @flight = Flight.find(params[:flight])
        @booking = Booking.new
        params[:passenger_count].to_i.times { @booking.passengers.build }
    end
    def create
        @flight = Flight.find(params[:flight])
        @booking = @flight.bookings.create(booking_params)
        if @booking.save
            @booking.passengers.each do |p|
                PassengerMailer.with(booking_id: @booking.id, passenger_id: p.id).booking_confirmation.deliver_later
            end
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
