class PlanetsController < ApplicationController
  before_action :set_planet, only: :show

  def show
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end
end
