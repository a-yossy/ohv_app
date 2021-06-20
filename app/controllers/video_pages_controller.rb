# frozen_string_literal: true

class VideoPagesController < ApplicationController
  def show
    @videos = Video.recently_released_at
  end
end
