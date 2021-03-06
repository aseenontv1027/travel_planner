module API
  class TripsController < ApplicationController

    def create
      trip = Trip.new(trip_params)
      trip.save!
      puts session

      user = User.find_by(id: params[:user_id])
      trip.users << user

      render json: { trip_id: trip.id, trip_name: trip.name }
    end

    def destroy
      puts "#{params} is params lol"
      @trip = Trip.find_by(id: params[:id])
      @trip.destroy
    end

    def show
      @trip = Trip.find_by(id: params[:id])
      render :json => {
        trip: @trip
      }
    end

    private

    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date)
    end
  end
end