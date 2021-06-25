# frozen_string_literal: true

class LivePagesController < ApplicationController
  def show
    @date = params[:live_date]&.in_time_zone&.all_month || (-Float::INFINITY..Float::INFINITY)
    @filter_lives = Live.where(start_time: @date).recently_held_live.page(params[:page]).per(5)

    @live_date_list = LiveDateViewObject.live_dates
  end
end
