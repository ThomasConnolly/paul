class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = Profile.new(params[:profile])
    @profile.user = current_user   
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
   
      if @profile.save
        redirect_to @profile
      else
        render :new
    end
  end
  
  def update
      if @profile.update(profile_params)
        redirect_to @profile
      else
        render :new 
    end
  end

  def destroy
    @profile.destroy
  end

  private
  


    def set_profile
      @profile = Profile.find(params[:id])
    end 

    def profile_params
      params.require(:profile).permit(:user_id, :cities, :background, :career, :family, :lifestyle, :civic, :church)
    end
end