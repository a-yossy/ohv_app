# frozen_string_literal: true

class CdPagesController < ApplicationController
  def index
    @cds = Cd.recently_released_at
  end

  def show
    @cd = Cd.find_by(id: params[:id])
    @songs = @cd.songs.recording_order
  end

  def new
    @cd_form_object = CdFormObject.new
  end

  def create
    @cd_form_object = CdFormObject.new(cd_form_object_params)
    if @cd_form_object.execute
      redirect_to action: :index
    else
      render :new
    end
  end

  def cd_form_object_params
    params.require(:cd_form_object).permit(:format, :picture, :title, :release_date, :price, :url, :name, :track_number)
  end
end
