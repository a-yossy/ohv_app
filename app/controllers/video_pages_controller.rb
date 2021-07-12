# frozen_string_literal: true

class VideoPagesController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    url = params[:video][:url]
    @video.url = "https://www.youtube.com/embed/#{url.last(11)}"
    if @video.save
      redirect_to action: :show
    else
      render :new
    end
  end

  def show
    @videos = Video.recently_released_at
  end

  private

  def video_params
    params.require(:video).permit(:title, :url, :release_date)
  end
end
