require 'rails_helper'

describe 'As a visitor on the Airline Show Page' do
  it "I can see a list of passengers that have lights on that airline" do
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

    flight_ac1.passengers << passenger_aa1
    flight_ac2.passengers << passenger_aa2

    visit airline_path(aircanada)

    expect(page).to have_content(passenger_ac1.name)
    expect(page).to have_content(passenger_ac2.name)
    expect(page).to have_content(passenger_ac3.name)
    expect(page).to have_content(passenger_ac4.name)
    expect(page).to have_content(passenger_aa1.name)
    expect(page).to have_content(passenger_aa2.name)
    expect(page).not_to have_content(passenger_aa3.name)
    expect(page).not_to have_content(passenger_aa4.name)
  end
end
