class LivesController < ApplicationController

  def show
    @lives = Live.all
  end
end
