require "csv"

AIRPORTS_FILE = Rails.root.join("db/seed_data/airports.csv")
AIRLINES_FILE = Rails.root.join("db/seed_data/airlines.csv")
ROUTES_FILE   = Rails.root.join("db/seed_data/routes.csv")

puts "Seeding airports..."
CSV.foreach(AIRPORTS_FILE, headers: false) do |row|
  Airport.create!(
    openflights_id: row[0],
    name: row[1],
    city: row[2],
    country: row[3],
    iata: row[4],
    icao: row[5],
    latitude: row[6],
    longitude: row[7],
    altitude: row[8],
    timezone: row[9],
    dst: row[10],
    tz: row[11]
  ) rescue nil
end

puts "Seeding airlines..."
CSV.foreach(AIRLINES_FILE, headers: false) do |row|
  Airline.create!(
    openflights_id: row[0],
    name: row[1],
    alias: row[2],
    iata: row[3],
    icao: row[4],
    callsign: row[5],
    country: row[6],
    active: row[7]
  ) rescue nil
end

puts "Seeding routes..."
CSV.foreach(ROUTES_FILE, headers: false) do |row|
  airline = Airline.find_by(openflights_id: row[1])
  src_airport = Airport.find_by(openflights_id: row[3])
  dst_airport = Airport.find_by(openflights_id: row[5])

  next unless airline && src_airport && dst_airport

  Route.create!(
    openflights_id: row[0],
    airline: airline,
    source_airport: src_airport,
    dest_airport: dst_airport,
    codeshare: row[6],
    stops: row[7],
    equipment: row[8]
  ) rescue nil
end

puts " Done seeding!"
