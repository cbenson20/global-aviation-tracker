class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.integer :openflights_id
      t.references :airline, foreign_key: true
      t.references :source_airport, foreign_key: { to_table: :airports }
      t.references :dest_airport, foreign_key: { to_table: :airports }
      t.string :codeshare
      t.integer :stops
      t.string :equipment

      t.timestamps
    end
  end
end
