# frozen_string_literal: true

class NewsPagesController < ApplicationController
  def index
    @informations = Information.recently_announced_at
  end

  def show
    @information = Information.find_by(id: params[:id])
  end
end
