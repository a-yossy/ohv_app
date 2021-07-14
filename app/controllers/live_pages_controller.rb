# frozen_string_literal: true

class LivePagesController < ApplicationController
  def index
    @date = params[:live_date]&.in_time_zone&.all_month || (-Float::INFINITY..Float::INFINITY)
    @filter_lives = Live.where(start_time: @date).recently_held_live.page(params[:page]).per(5)

    @live_date_list = LiveDateViewObject.live_dates
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.new(live_params)
    if @live.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @live = Live.find_by(id: params[:id])
  end

  def update
    @live = Live.find_by(id: params[:id])
    if @live.update(live_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    Live.find_by(id: params[:id]).destroy
    redirect_to action: :index
  end

  private

  def live_params
    params.require(:live).permit(:place, :title, :detail, :open_hour, :start_hour, :advance_ticket_price, :doors_ticket_price, :start_time)
  end
end
