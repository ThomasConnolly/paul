class Drop5Controller < ApplicationController
  def index
    @drop5_total = Drop5.all
  end

  def new
    @drop5 = Drop5.new
    @drop5_total = Drop5.all
  end

  def create
    @drop5 = Drop5.new(drop5_params)
  end

  def drop5_params
      params.require(:drop5).permit(:name, :pledge, :how, :honey)
    end
end
