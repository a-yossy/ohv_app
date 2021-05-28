class CdsPagesController < ApplicationController
  def index
    @cds = Cd.all
  end

  def show
    @cd = Cd.find_by(id: params[:id])
    @songs = @cd.songs
  end
end
