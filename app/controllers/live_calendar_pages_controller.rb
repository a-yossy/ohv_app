# frozen_string_literal: true

class LiveCalendarPagesController < ApplicationController
  def show
    @lives = Live.all
  end
end
