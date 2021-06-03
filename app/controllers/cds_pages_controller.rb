class CdsPagesController < ApplicationController
  def index
    @cds = Cd.recent.all
  end

  def show
    @cd = Cd.find_by(id: params[:id])
    @songs = @cd.songs.song_order
  end
end
