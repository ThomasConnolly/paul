class ProfilesController < ApplicationController

  before_action :set_profile, only: [:edit, :update, :destroy]



  def edit
    @profile = current_user.profile
    
  end
  
  def update
      if @profile.update(profile_params)
        redirect_to posts_path
      else
        render :new
    end
  end

  def profile
  end

  private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:user_id, :cities, :background, :career, :family, :lifestyle, :civic, :church)
    end
end