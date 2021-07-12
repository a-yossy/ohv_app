# frozen_string_literal: true

class NewsPagesController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create edit update destroy]

  def index
    @informations = Information.recently_announced_at.page(params[:page]).per(5)
  end

  def show
    @information = Information.find_by(id: params[:id])
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      flash[:success] = t '.success'
      redirect_to action: :show, id: @information.id
    else
      render :new
    end
  end

  def edit
    @information = Information.find_by(id: params[:id])
  end

  def update
    @information = Information.find_by(id: params[:id])
    if @information.update(information_params)
      flash[:success] = t '.success'
      redirect_to action: :show, id: @information.id
    else
      render :edit
    end
  end

  def destroy
    Information.find_by(id: params[:id]).destroy
    flash[:success] = t '.success'
    redirect_to action: :index
  end

  private

  def information_params
    params.require(:information).permit(:title, :picture, :announcement_date, :content, :priority)
  end
end
