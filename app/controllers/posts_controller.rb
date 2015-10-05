class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :all_posts, only: [:index, :create, :update, :destroy]
  
  respond_to :html, :js


  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
      @post.save
      redirect_to posts_path(@post)
  end
   

  def update
    @post.update_attributes(post_params)
      redirect_to posts_path(@post)
  end

  def destroy
    @post.destroy
  end





private

  def all_posts
    @posts = Post.all
  end

  def post_params
    params.require(:post).permit(:content, :post_picture, photos: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end