class RoutesController < ApplicationController
  def index
    @routes = Route.includes(:airline, :source_airport, :dest_airport).page(params[:page]).per(50)
  end
  def show
    @route = Route.find(params[:id])
  end
end
