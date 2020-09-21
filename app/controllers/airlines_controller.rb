class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(airline_params[:id])
    @passengers = @airline.passengers.distinct
  end

  private
    def airline_params
      params.permit(:id)
    end
end
