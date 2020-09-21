class TicketsController < ApplicationController
  def destroy
    Ticket.find(ticket_params[:id]).destroy
    redirect_to flights_path
  end

  def ticket_params
    params.permit(:id)
  end
end
