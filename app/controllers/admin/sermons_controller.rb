class Admin::SermonsController < ApplicationController
 before_action :authenticate_user!
 before_action :set_sermon, only: [:show, :edit, :update, :destroy] 


  def new
    @sermon = Sermon.new
  end

  def edit
  end

  def create
    @sermon = Sermon.new(sermon_params)

      if @sermon.save
        redirect_to @sermon, notice: 'Sermon was successfully created.' 
      else
        render :new 
    end
  end

  def update
      if @sermon.update(sermon_params)
      redirect_to @sermon, notice: 'Sermon was successfully updated.'
    end
  end

  def destroy
    @sermon.destroy
      redirect_to sermons_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sermon
      @sermon = Sermon.find(params[:id])
    end 
   
    def sermon_params
      params.require(:sermon).permit(:title, :cites, :delivered_on, :sermon_body, :homilist_id,)
    end
end
