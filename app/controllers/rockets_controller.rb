class RocketsController < ApplicationController
  def show
    @rocket = Rocket.find(params[:id])
    @order = Order.new
  end

  # def index
  #   @rockets = Rocket.all
  # end

  def index

    @params = search_params

    if !@params[:continent].empty?
      @rockets_init = Rocket.where(continent: @params[:continent])
    else
      @rockets_init = Rocket.all
    end

    @rockets = []
    @rockets_init.each do |rocket_init|
      @rockets << rocket_init
    end

    search_begin_date = @params[:begin_date]
    search_end_date = @params[:end_date]

    if (search_begin_date.empty? || search_end_date.empty? || search_begin_date == 'From' || search_end_date == 'To')
      search_begin_date = nil
      search_end_date   = nil
    else
      search_begin_date = Date.iso8601(search_begin_date)
      search_end_date   = Date.iso8601(search_end_date)
    end

    unless search_begin_date.nil? || search_end_date.nil?
      @rockets.each do |rocket|
        unless rocket.orders.empty?
          rocket.orders.each do |order|
            if order.status == 'Accepted'
              unless (order.begin_date < search_begin_date && order.end_date < search_begin_date) || (order.begin_date > search_end_date && order.end_date > search_end_date)
                @rockets.delete(rocket)
              end
            end
          end
        end
      end
    end
    @rockets
  end

  private

  def search_params
    params.require(:search).permit(:continent, :begin_date, :end_date)
  end
end
