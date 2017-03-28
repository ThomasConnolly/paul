class PrayersController < ApplicationController

before_action :set_prayer, only: [:show, :edit, :update]

  def index
    @prayers = Prayer.all.order('id')
  end

  def new
    @prayer = Prayer.new
  end

  def show
  end

  def create
    @prayer = Prayer.new(prayer_params)
    if @prayer.save
      redirect_to @prayers
    else
      render :new
    end
  end

  def update
   @prayer.update(prayer_params)
      redirect_to @prayer
  end


private

  def set_prayer
    @prayer = Prayer.find(params[:id])
  end

  def prayer_params
    params.require(:prayer).permit(:day_of_prayer, :time_of_prayer, :name, :honey)
    end
  end


