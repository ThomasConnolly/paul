class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  
  def index
    @comments = @post.comments
  end
  
  def show
    @comment = @post.comments.find(params[:id])
  end
  
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
      respond_to do |format|
        format.html { redirect_to posts_path(@comment) }
        format.js
    end
  end
 



  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
    end
  end
