class FlightsController < ApplicationController
    def index
        @flights = Flight.all
        @airport_options = Airport.all.map{|a| [a.location_name, a.id]}
        @query_results = Flight.where(origin_id: params[:origin_id], destination_id: params[:destination_id])
    end
end
