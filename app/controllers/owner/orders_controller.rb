class Owner::OrdersController < ApplicationController
  def index
    @orders = current_user.orders.order(created_at: :asc)
  end

  def decline
    update_status('Declined')
  end

  def accept
    update_status('Accepted')
  end

  def cancel
    update_status('Pending')
  end

  private

  def update_status(new_status)
    @order = Order.find(params[:id])
    @order.status = new_status
    @order.save
    redirect_to owner_orders_path
  end
end
