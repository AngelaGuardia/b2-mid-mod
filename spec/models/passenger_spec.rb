require 'rails_helper'

describe Passenger do
  describe 'relationships' do
    it { should have_many :tickets }
    it { should have_many(:flights).through(:tickets) }
  end

  describe 'instance methods' do
    it '.get_ticket' do
      aircanada = Airline.create!(name: "AirCanada")
      flight_ac1 = Flight.create!(number: "AC 1001", airline: aircanada)
      flight_ac2 = Flight.create!(number: "AC 1002", airline: aircanada)

      passenger = Passenger.create!(name:"Justin")
      ticket1 = Ticket.create!(passenger: passenger, flight: flight_ac1)
      ticket2 = Ticket.create!(passenger: passenger, flight: flight_ac2)

      expect(passenger.get_ticket(flight_ac1)).to eq(ticket1.id)
      expect(passenger.get_ticket(flight_ac2)).to eq(ticket2.id)
    end

    it ".total_flights" do
      aircanada = Airline.create!(name: "AirCanada")
      flight_ac1 = Flight.create!(number: "AC 1001", airline: aircanada)
      flight_ac2 = Flight.create!(number: "AC 1002", airline: aircanada)

      passenger = Passenger.create!(name:"Justin")
      ticket1 = Ticket.create!(passenger: passenger, flight: flight_ac1)
      ticket2 = Ticket.create!(passenger: passenger, flight: flight_ac2)

      expect(passenger.total_flights).to eq(2)
    end
  end
end
