class CdsController < ApplicationController
  def index
    @cds = Cd.all
  end

  def show
    @cd = Cd.find_by(params[:id])
    @songs = @cd.songs
  end
end
