class PostsController < ApplicationController

before_action :authenticate_user! 
before_action :set_post, only: [:show, :edit, :update, :destroy]
 
  def index
    @posts = Post.all.order(:created_at => :desc).includes(:comments)
  end
  
  def show
    @post = Post.find(params[:id])
      @comment = Comment.new
      @comment.post_id = @post.id
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
      @post.user = current_user
      if @post.save
        redirect_to @post
      else
        render 'new'
    end
  end

  def update
      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
    end
  end

  def destroy
    @post.destroy
      redirect_to posts_path, notice: 'Post was removed'

  end






private

   def set_post
      @post = Post.find(params[:id])
    end




    def post_params
      params.require(:post).permit(:content, :user_id, :post_picture, photos: [])
    end
  end

