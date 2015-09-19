class ProfilesController < ApplicationController
 before_action :authenticate_user! 
 before_action :set_profile, only: [:show, :edit, :update]
  
 
  def edit
  end

  def show
  end
  
  def update
    if @profile.update_attributes(profile_params)
      redirect_to profile_path(@profile)
      
    else
      render 'edit'
    end
  end

  def index
    @profiles = Profile.all
  end
  
  def new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
    redirect_to current_user_path
  else
    render 'new'
  end
end



private
    def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:id, :user_id, :cities, :background, :career, :family, :lifestyle, :civic, :church)
  end
end
