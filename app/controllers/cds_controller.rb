class CdsController < ApplicationController
  def index
  end

  def show
    @cd = Cd.find(params[:id])
    @song = @cd.songs
    @picture = @cd.format + ".jpg"
  end
end
