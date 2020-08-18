class Owner::RocketsController < ApplicationController

  def index
    @rockets = current_user.rockets
  end

  def new
    @rocket = Rocket.new
  end

  def create
    @rocket = Rocket.new(rocket_params)
    @rocket.owner = current_user
    @rocket.save
    redirect_to rocket_path(@rocket)
  end

  private

  def rocket_params
    params.require(:rocket).permit(:name, :daily_price, :autonomy, :location)
  end
end
