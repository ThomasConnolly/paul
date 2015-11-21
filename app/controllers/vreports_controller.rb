class vreportsController < ApplicationController
  before_action :authenticate_user!
  
  respond_to :html, :js

  def new
    @vreport = Vreport.new
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @vreports = Vreport.all
  end


 def show
  @vreport = Vreport.find(params[:id])
  @commentable = @vreport.comments
  @comment = Comment.new
end
  
  def create
    @vreport = current_user.vreports.build(vreport_params)
    if @vreport.save
      respond_to do |format|
        format.html { redirect_to vreports_path(@vreport) }
        format.js
      end
    end
  end
   

  def update
    @vreport.update_attributes(vreport_params)
      @vreport.save
      respond_to do |format|
      format.html { redirect_to vreports_path }
      format.js
      end 
  end

  def edit
  end


  def destroy
    @vreport.destroy
  end





private

  def all_vreports
    @vreports = Vreport.all
  end

  def set_vreports
    @vreport = Vreport.find(params[:id])
  end

  def vreport_params
    params.require(:vreport).permit(:content)
  end
end