class AirlinesController < ApplicationController
  def index
    @q = params[:q].to_s.strip
    scope = Airline.all
    scope = scope.where("name LIKE :q OR country LIKE :q OR iata LIKE :q OR icao LIKE :q", q: "%#{@q}%") if @q.present?
    @airlines = scope.order(:country, :name).page(params[:page]).per(25)
  end

  def show
    @airline = Airline.find(params[:id])
    @served = (@airline.served_source_airports + @airline.served_dest_airports).uniq.take(100)
  end
end
