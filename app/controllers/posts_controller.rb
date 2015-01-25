class PostsController < ApplicationController

before_action :authenticate_user! 
   before_action :set_post, only: [:show, :edit, :update, :destroy]
 
  def index
    @posts = Post.all
  end
  
  def show
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def new
    @post = current_user.posts.new(params[:post])
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path,  notice: 'post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :user, :picture)
    end
  end

