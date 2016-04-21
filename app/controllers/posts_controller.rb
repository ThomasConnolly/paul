# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :members_only
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
    @posts = Post.includes(:comments).all
    @post = Post.new
  end


  def show
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    end
  end
   
  def edit
  end

  def update
    @post.update(post_params)
      redirect_to posts_path
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

  def members_only
    unless current_user.vestry? or current_user.admin? or current_user.member?
      redirect_to root_path, :alert => "You must be a member of St. Paul's to 
      use this function."
    end
  end
end