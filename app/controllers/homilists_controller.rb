# == Schema Information
#
# Table name: homilists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  photo      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

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
      if @homilist.save
        redirect_to @homilist
      else
        render :new
      end
  end

  def update
      if @homilist.update(homilist_params)
        redirect_to @homilist
      else
        render :edit 
      end
  end

  def destroy
    @homilist.destroy
      redirect_to @homilists
  end




private
  def set_Homilist
    @homilist = Homilist.find(params[:id])
  end

  def homilist_params
    params.require(:homilist).permit(:name, :title, :photo)
  end
end
