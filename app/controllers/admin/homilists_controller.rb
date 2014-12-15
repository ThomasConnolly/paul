class Admin::HomilistsController < ApplicationController

  before_action :set_homilist, only: [:show, :edit, :update, :destroy]

 
  def index
    @homilists = Homilist.all
  end

  def show
  end

  def new
    @homilist = Homilist.new
  end

  def edit
  end

  # POST /homilists
  # POST /homilists.json
  def create
    @homilist = Homilist.new(homilist_params)
    
    respond_to do |format|
      if @homilist.save
        format.html { redirect_to admin_homilists_path,  notice: 'homilist was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @homilist.update(homilist_params)
        format.html { redirect_to @homilist, notice: 'Homilist was successfully updated.' }
        format.json { render :show, status: :ok, location: @homilist }
      else
        format.html { render :edit }
        format.json { render json: @homilist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @homilist.destroy
      redirect_to admin_homilists_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homilist
      @homilist = Homilist.find(params[:id])
    end

   
    def homilist_params
      params.require(:homilist).permit(:name, :title, :photo)
    end
end
