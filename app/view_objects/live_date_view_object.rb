# frozen_string_literal: true

class LiveDateViewObject
  def self.live_dates
    all_lives = Live.recently_held_live
    live_dates = all_lives.map do |live|
      view_date = live.start_time.strftime("%Y-%m")
      filter_date = live.start_time.in_time_zone.all_month

      [view_date, filter_date]
    end
    ([["all_live", -Float::INFINITY..Float::INFINITY]] + live_dates).to_set
  end
end
