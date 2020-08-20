class RocketsController < ApplicationController
  def show
    @rocket = Rocket.find(params[:id])
    @order = Order.new
  end

  def index
    @rockets = Rocket.all
  end

  # def index
  #   if !search_params[:continent].empty?
  #     @rockets = Rocket.where(continent: search_params[:continent])
  #   else
  #     @rockets = Rocket.all
  #   end

  #   begin_date = search_params[:begin_date]
  #   end_date = search_params[:end_date]

  #   if (begin_date.empty? || end_date.empty? || begin_date == 'From' || end_date == 'To')
  #     begin_date = nil
  #     end_date   = nil
  #   end

  #   unless begin_date.nil? || end_date.nil?
  #     @rockets.each do |rocket|
  #       unless rocket.orders.empty?
  #         rocket.orders.each do |order|
  #           if order.status == 'Accepted'
  #             unless (order.begin_date < search_params[:begin_date] && order.end_date < search_params[:begin_date]) || (order.begin_date > search_params[:end_date] && order.end_date > search_params[:end_date]
  #               @rockets.delete(rocket))
  #             end
  #           end
  #         end
  #       end
  #     end
  #   end
  #   @rockets
  # end

  private

  def search_params
    params.require(:search).permit(:continent, :begin_date, :end_date)
  end
end
