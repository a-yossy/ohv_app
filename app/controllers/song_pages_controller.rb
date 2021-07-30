# frozen_string_literal: true

class SongPagesController < ApplicationController
  def edit
    @song = Song.find_by(id: params[:id])
  end

  def update
    @song = Song.find_by(id: params[:id])
    if @song.update(song_params)
      redirect_to cd_page_path(@song.cd_id)
    else
      render :edit
    end
  end

  def song_params
    params.require(:song).permit(:name, :track_number)
  end
end
