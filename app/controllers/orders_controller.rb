class OrdersController < ApplicationController
  def create
  end

  def index
    @orders = current_user.orders
    @rocket = Rocket.new
  end

  def cancel
    @rocket = Rocket.new
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  def show
  end

  def new
  end
end
