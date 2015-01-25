class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  
  def index
    @albums = Album.all.order('created_at DESC')
  end
  
  def new
    @album = current.user.albums.build
  end
  
  def show
  end

  def create
    @album = current_user.albums.build(album_params)
    authorize @album
    if @album.save
      # to handle multiple images upload on create
      if params[:images]
        params[:images].each { |image|
          @album.photos.create(image: image)
        }
      flash[:notice] = "Your album has been created."
      redirect_to @album
        }
    else 
      flash[:alert] = "Something went wrong."
      render :new
    end
  end
  def update
    authorize @album
    if @album.update(params[:album].permit(:title,:description))
      # to handle multiple images upload on update when user add more picture
      if params[:images]
        params[:images].each { |image|
          @album.photos.create(image: image)
        }
    
      flash[:notice] = "Album has been updated."
      redirect_to @album
    else
      render :edit
    end
  end

  def show
end

  def destroy
  end



  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :description, :user_id)
    end
  end
end
