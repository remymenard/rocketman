class OrdersController < ApplicationController
  def create
  end

  def index
    @orders = current_user.orders
  end

  def show
  end

  def new
  end
end
