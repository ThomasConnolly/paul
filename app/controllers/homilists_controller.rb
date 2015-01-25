class HomilistsController < ApplicationController
  before_action :set_Homilist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy]

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

  def create
    @homilist = Homilist.new(homilist_params)

    respond_to do |format|
      if @homilist.save
        format.html { redirect_to @homilist, notice: 'Homilist was successfully created.' }
        format.json { render :show, status: :created, location: @homilist }
      else
        format.html { render :new }
        format.json { render json: @homilist.errors, status: :unprocessable_entity }
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
    respond_to do |format|
      format.html { redirect_to homilists_url, notice: 'Homilist entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




private
  def set_Homilist
    @homilist = Homilist.find(params[:id])
  end

  def homilist_params
    params.require(:homilist).permit(:name, :title, :photo)
  end
end
