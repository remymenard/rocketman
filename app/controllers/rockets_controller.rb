class RocketsController < ApplicationController
  def new
  end

  def show
    @rocket = Rocket.find(params[:id])
  end

  def index
    @rockets = Rocket.all
  end

  def create
  end

  def update
  end

  def edit
  end
end
