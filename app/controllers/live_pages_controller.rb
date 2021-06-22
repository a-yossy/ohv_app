# frozen_string_literal: true

class LivePagesController < ApplicationController
  def show
    @date = params[:live_date]
    @filter_lives = if @date.blank?
                      Live.recently_live_date
                    else
                      Live.where(start_time: @date.in_time_zone.all_month)
                    end

    @live_date_list = [["recent live", ""]]
    lives = Live.recently_live_date
    lives.each do |live|
      view_date = live.start_time.strftime("%Y-%m")
      filter_date = "#{view_date}-01"
      if @live_date_list.exclude?([view_date, filter_date])
        @live_date_list.push([view_date, filter_date])
      end
    end
  end
end
