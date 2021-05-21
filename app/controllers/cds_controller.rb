class CdsController < ApplicationController
  def index
    @cds = Cd.all
  end

  def show
    @cd = Cd.find(params[:id])
    @songs = @cd.songs
  end
end
