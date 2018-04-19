class RatingsController < ApplicationController

before_action :authenticate_user!
before_action :set_characteristic
before_action :set_rating, only: [:show, :edit, :update, :destroy]

 

  def show
  end

   def index
    if params[:characteristic_id]
      @ratings = Characteristic.find(params[:characteristic_id]).ratings
      @characteristic = Characteristic.find(params[:characteristic_id])
    else
      @ratings = Rating.all
      @rating = Characteristic.find(params[:characteristic_id]).rating
    end         
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user_id = current_user.id if current_user
    if @rating.save
      redirect_to characteristics_path, notice: "Examine another characteristic and rate it."
    else
      render "new"
    end
  end

  def update
  end




  private

    def set_characteristic
      @characteristic = Characteristic.find(params[:characteristic_id])
    end

    def set_rating
      @rating = @characteristic.ratings.find(params[:id])
    end

    def rating_params
      params.require(:rating).permit(:characteristic_id, :user_id, :score)
    end
end
