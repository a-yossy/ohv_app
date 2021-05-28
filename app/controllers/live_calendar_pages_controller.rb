class LiveCalendarPagesController < ApplicationController

  def show
    @lives = Live.all
  end
end
