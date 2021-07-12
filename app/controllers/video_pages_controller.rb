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
      redirect_to action: :index
    else
      render :new
    end
  end

  def index
    @videos = Video.recently_released_at
  end

  def edit
    @video = Video.find_by(id: params[:id])
  end

  def update
    @video = Video.find_by(id: params[:id])
    url = params[:video][:url]
    @video.url = "https://www.youtube.com/embed/#{url.last(11)}"
    if @video.update(video_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :url, :release_date)
  end
end
