class AirportsController < ApplicationController
  def index
    @q = params[:q].to_s.strip
    @country = params[:country].to_s.strip

    scope = Airport.all
    if @q.present?
      scope = scope.where("name LIKE :q OR city LIKE :q OR country LIKE :q OR iata LIKE :q OR icao LIKE :q", q: "%#{@q}%")
    end
    scope = scope.where(country: @country) if @country.present?

    @countries = Airport.where.not(country: [nil, ""]).distinct.order(:country).pluck(:country)
    @airports = scope.order(:country, :city, :name).page(params[:page]).per(25)
  end

  def show
    @airport = Airport.find(params[:id])
    @destinations = @airport.destinations.limit(50)
    @airlines = (@airport.airlines_via_source + @airport.airlines_via_dest).uniq.take(50)
  end
end
