class SermonsController < ApplicationController
 

  def index
    @sermons = Sermon.all.order("delivered_on DESC")
  end

  def show
    @sermon = Sermon.find(params[:id])
  end



private
    def sermon_params
      params.require(:sermon).permit(:title, :cites, :delivered_on, :sermon_body, :homilist_id,)
    end
end
