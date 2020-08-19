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
    if @rocket.valid?
      @rocket.save
      redirect_to rocket_path(@rocket)
    else
      render :new
    end
  end

  private

  def rocket_params
    params.require(:rocket).permit(:name, :daily_price, :autonomy, :location, :photo)
  end
end
