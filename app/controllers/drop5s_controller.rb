class Drop5sController < ApplicationController
  def index
    @drop5s = Drop5.all
    @drop5 = Drop5.new
  end

  def show
    @drop5 = Drop5.find(params[:id])
  end

  def new
    @drop5 = Drop5.new
  end

  def create
    @drop5 = Drop5.create(drop5_params)
    if @drop5.save
      redirect_to drop5_path(@drop5)
    else
      render 'new'
    end
  end

  def drop5_params
      params.require(:drop5).permit(:name, :pledge, :how, :honey)
    end
end
