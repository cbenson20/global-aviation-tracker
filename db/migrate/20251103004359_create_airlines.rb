class CreateAirlines < ActiveRecord::Migration[8.0]
  def change
    create_table :airlines do |t|
      t.integer :openflights_id
      t.string :name
      t.string :alias
      t.string :iata
      t.string :icao
      t.string :callsign
      t.string :country
      t.string :active

      t.timestamps
    end
  end
end
