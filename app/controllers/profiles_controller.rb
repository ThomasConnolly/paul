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

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Your profile was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
      else
        render :new
        
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profile_url, notice: 'Book was successfully destroyed.' }
    end
  end

  private
  


    def set_profile
      @profile = Profile.find(params[:id])
    end 

    def profile_params
      params.require(:profile).permit(:user_id, :cities, :background, :career, :family, :lifestyle, :civic, :church)
    end
end