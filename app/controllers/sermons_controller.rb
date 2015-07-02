class SermonsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :set_sermon, only: [:show, :edit, :update, :destroy] 

  def index
    @sermons = Sermon.all.order("delivered_on DESC")
  end

  def show
  end

  def new
    @sermon = Sermon.new
  end

  def edit
  end

  def create
    @sermon = Sermon.new(sermon_params)
      if @sermon.save
        redirect_to @sermon 
      else
        render :new 
    end
  end

  def update
      if @sermon.update(sermon_params)
      redirect_to @sermon
    end
  end

  def destroy
    @sermon.destroy
      redirect_to sermons_url
  end



  private
    def set_sermon
      @sermon = Sermon.find(params[:id])
    end 
   
    def sermon_params
      params.require(:sermon).permit(:title, :cites, :delivered_on, :sermon_body, :id, :homilist_id)
    end
end

