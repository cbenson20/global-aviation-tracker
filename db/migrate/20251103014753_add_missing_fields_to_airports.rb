class AddMissingFieldsToAirports < ActiveRecord::Migration[8.0]
  def change
    add_column :airports, :iata, :string
    add_column :airports, :icao, :string
    add_column :airports, :latitude, :float
    add_column :airports, :longitude, :float
    add_column :airports, :altitude, :integer
    add_column :airports, :timezone, :float
    add_column :airports, :dst, :string
    add_column :airports, :tz, :string
  end
end
