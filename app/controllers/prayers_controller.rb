class PrayersController < ApplicationController
  
before_action :set_prayer, only: [:show, :edit, :update]

  def index
    @prayers = Prayer.all.order('id')
    @prayer = Prayer.new
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

  def edit
  end

  def update
    @prayer.update(prayer_params)
      if @prayer.save
        redirect_to @prayer
      else
        render :new
    end
  end


private

  def set_prayer
    @prayer = Prayer.find(params[:id])
  end

  def prayer_params
    params.require(:prayer).permit(:day_of_prayer, :time_of_prayer, :name, :honey, :pray_time)
    end
  end

