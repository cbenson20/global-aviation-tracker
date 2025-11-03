class Airport < ApplicationRecord
  has_many :source_routes, class_name: "Route", foreign_key: :source_airport_id, dependent: :destroy
  has_many :dest_routes,   class_name: "Route", foreign_key: :dest_airport_id, dependent: :destroy

  has_many :destinations, through: :source_routes, source: :dest_airport   # self M2M
  has_many :origins,      through: :dest_routes,   source: :source_airport # self M2M

  has_many :airlines_via_source, through: :source_routes, source: :airline
  has_many :airlines_via_dest,   through: :dest_routes,   source: :airline

  validates :name, :city, :country, presence: true
  validates :country, presence: true
  validates :iata, length: { is: 3 }, allow_blank: true
  validates :icao, length: { is: 4 }, allow_blank: true
  validates :latitude,  numericality: { greater_than: -90,  less_than: 90  }, allow_nil: true
  validates :longitude, numericality: { greater_than: -180, less_than: 180 }, allow_nil: true
end
