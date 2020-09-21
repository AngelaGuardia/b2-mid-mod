require 'rails_helper'

describe 'As a visitor on the Passengers Index Page' do
  it "I can see all passgers and their total flights" do
    aircanada = Airline.create!(name: "AirCanada")
    flight_ac1 = Flight.create!(number: "AC 1001", airline: aircanada)
    flight_ac2 = Flight.create!(number: "AC 1002", airline: aircanada)
    passenger_ac1 = flight_ac1.passengers.create!(name:"Justin")
    passenger_ac2 = flight_ac1.passengers.create!(name:"Barb")
    passenger_ac3 = flight_ac2.passengers.create!(name:"Ruth")
    passenger_ac4 = flight_ac2.passengers.create!(name:"Ada")

    american = Airline.create!(name: "Amercian Airlines")
    flight_aa1 = Flight.create!(number: "AA 1001", airline: american)
    flight_aa2 = Flight.create!(number: "AA 1002", airline: american)
    passenger_aa1 = flight_aa1.passengers.create!(name:"Kim")
    passenger_aa2 = flight_aa1.passengers.create!(name:"John")
    passenger_aa3 = flight_aa2.passengers.create!(name:"Bob")
    passenger_aa4 = flight_aa2.passengers.create!(name:"Cam")

    flight_ac2.passengers << passenger_aa2
    #same passenger on two flights
    flight_ac1.passengers << passenger_aa1
    flight_ac2.passengers << passenger_aa1

    one_flight = [passenger_ac1, passenger_ac2, passenger_ac3, passenger_ac4, passenger_aa3, passenger_aa4]

    two_flights = [passenger_aa2]

    three_flights = [passenger_aa1]

    visit passengers_path

    one_flight.each do |passenger|
      within("#passenger-#{passenger.id}") do
        expect(page).to have_content(passenger.name)
        expect(page).to have_content(1)
      end
    end

    two_flights.each do |passenger|
      within("#passenger-#{passenger.id}") do
        expect(page).to have_content(passenger.name)
        expect(page).to have_content(2)
      end
    end

    three_flights.each do |passenger|
      within("#passenger-#{passenger.id}") do
        expect(page).to have_content(passenger.name)
        expect(page).to have_content(3)
      end
    end
  end
end
