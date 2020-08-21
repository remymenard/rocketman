class Owner::OrdersController < ApplicationController
  def index
    @orders = current_user.owner_orders.order(created_at: :asc)
  end

  def decline
    update_status('Declined')
  end

  def list
    @orders = current_user.owner_orders.order(created_at: :asc)
    @formatted_orders = @orders.map{ |order|
      {
        "title" => "#{User.find(order.renter_id).first_name} #{User.find(order.renter_id).last_name}",
        "start" => order.begin_date,
        "end" => order.end_date,

      }
    }
    render :json => @formatted_orders
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
