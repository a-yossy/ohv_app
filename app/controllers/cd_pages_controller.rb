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

  def edit
    @cd = Cd.find_by(id: params[:id])
  end

  def update
    @cd = Cd.find_by(id: params[:id])
    if @cd.update(cd_params)
      redirect_to action: :show, id: @cd.id
    end
  end

  private

  def cd_params
    params.require(:cd).permit(:format, :picture, :title, :release_date, :price, :url)
  end

  def cd_form_object_params
    params.require(:cd_form_object).permit(:format, :picture, :title, :release_date, :price, :url, songs: songs_params).merge(form_count: form_count)
  end

  def form_count
    params[:form_count].to_i
  end

  def songs_params
    form_count.times.map { |num| ["name_#{num + 1}".to_sym, "track_number_#{num + 1}".to_sym] }.flatten
  end
end
