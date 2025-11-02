class Airline < ApplicationRecord
  has_many :routes, dependent: :destroy
  has_many :served_source_airports, through: :routes, source: :source_airport
  has_many :served_dest_airports, through: :routes, source: :dest_airport
  # distinct list of airports (either direction)
  has_many :served_airports, -> { distinct }, through: :routes, source: :source_airport

  validates :name, presence: true
  validates :iata, length: { maximum: 3 }, allow_blank: true
  validates :icao, length: { maximum: 4 }, allow_blank: true
  validates :active, inclusion: { in: %w[Y N], message: "must be Y or N" }, allow_blank: true
end
