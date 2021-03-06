require 'rails_helper'

describe 'As a visitor on the Flight Index page' do
  it "I can remove passengers" do
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

    visit flights_path

    Flight.all.each do |flight|
      within("#flight-#{flight.id}") do
        flight.passengers.each do |passenger|
          expect(page).to have_link('Remove')
        end
      end
    end

    within("#passenger-#{passenger_ac1.id}") do
      click_link('Remove')
    end

    expect(current_path).to eq(flights_path)

    expect(page).not_to have_css("#passenger-#{passenger_ac1.id}")
  end
end
