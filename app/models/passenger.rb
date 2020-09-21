class Passenger < ApplicationRecord
  has_many :tickets
  has_many :flights, through: :tickets

  def get_ticket(flight)
    self.tickets.where(flight: flight).first.id
  end
end
