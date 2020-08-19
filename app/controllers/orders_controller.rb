class OrdersController < ApplicationController
  def create
  end

  def index
    @orders = current_user.orders
    @rocket = Rocket.new
  end

  def show
  end

  def new
  end
end
