# frozen_string_literal: true

class TopPagesController < ApplicationController
  def show
    @informations = Information.recently_announced_at.first(2)
  end
end
