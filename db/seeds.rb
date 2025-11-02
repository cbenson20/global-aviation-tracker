# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "csv"

def load_csv(name)
  CSV.read(Rails.root.join("db", "seed_data", name), headers: false)
end

puts "Seeding..."
ActiveRecord::Base.transaction do
  Route.delete_all
  Airline.delete_all
  Airport.delete_all

  # AIRPORTS: id, name, city, country, IATA, ICAO, lat, lon, ...
  load_csv("airports.csv").each do |r|
    Airport.create!(
      openflights_id: r[0].to_i,
      name:     r[1],
      city:     r[2],
      country:  r[3],
      iata:     (r[4] unless r[4] == "\\N"),
      icao:     (r[5] unless r[5] == "\\N"),
      latitude:  (r[6].to_f unless r[6] == "\\N"),
      longitude: (r[7].to_f unless r[7] == "\\N")
    )
  end
  puts "Airports: #{Airport.count}"

  # AIRLINES: id, name, alias, IATA, ICAO, callsign, country, active
  load_csv("airlines.csv").each do |r|
    Airline.create!(
      openflights_id: r[0].to_i,
      name:     r[1],
      iata:     (r[3] unless r[3] == "\\N"),
      icao:     (r[4] unless r[4] == "\\N"),
      callsign: (r[5] unless r[5] == "\\N"),
      country:  (r[6] unless r[6] == "\\N"),
      active:   (r[7] unless r[7] == "\\N")
    )
  end
  puts "Airlines: #{Airline.count}"

  # ROUTES: airline_code, airline_id, src_code, src_id, dst_code, dst_id, codeshare, stops, equipment
  load_csv("routes.csv").each do |r|
    airline = Airline.find_by(openflights_id: r[1].to_i)
    src     = Airport.find_by(openflights_id: r[3].to_i)
    dst     = Airport.find_by(openflights_id: r[5].to_i)
    next unless airline && src && dst

    Route.create!(
      openflights_id: nil,
      airline: airline,
      source_airport: src,
      dest_airport:   dst,
      codeshare: (r[6] unless r[6] == "\\N"),
      stops:     (Integer(r[7]) rescue 0),
      equipment: r[8]
    )
  end
  puts "Routes: #{Route.count}"
end
puts "Done."
