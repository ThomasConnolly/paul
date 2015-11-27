class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :all_posts, only: [:index, :create, :update, :destroy]
  respond_to :html, :js

  def new
    @post = Post.new
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @posts = Post.all
    @post = Post.new
  end


 def show
end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path(@post) }
        format.js
      end
    end
  end
   

  def update
    @post.update_attributes(post_params)
      @post.save
      respond_to do |format|
      format.html { redirect_to posts_path }
      format.js
      end 
  end

  def edit
  end


  def destroy
    @post.destroy
  end





private

  def all_posts
    @posts = Post.all
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :post_picture, photos: [])
  end
end
