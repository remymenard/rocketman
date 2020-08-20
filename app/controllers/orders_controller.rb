class OrdersController < ApplicationController

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

  def create
    @rocket = Rocket.find(params[:rocket_id])

    unless (order_params[:begin_date].empty? || order_params[:end_date].empty?)
      begin_date = Date.iso8601(order_params[:begin_date])
      end_date = Date.iso8601(order_params[:end_date])
      total_price = @rocket.daily_price * (end_date - begin_date).to_i
    end

    @order = Order.new(rocket_id: @rocket.id,
                       renter_id: current_user.id,
                       begin_date: begin_date,
                       end_date: end_date,
                       total_price: total_price)

    if @order.save
      redirect_to orders_path
    else
      redirect_to rocket_path(@rocket)
    end
  end

  private

  def order_params
    params.require(:order).permit(:begin_date, :end_date)
  end
end
