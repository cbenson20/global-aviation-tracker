class Route < ApplicationRecord
  belongs_to :airline
  belongs_to :source_airport, class_name: "Airport"
  belongs_to :dest_airport,   class_name: "Airport"

  validates :stops, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
