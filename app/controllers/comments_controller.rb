class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comments, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:new, :create, :edit, :destroy, :update]
  
  respond_to :html, :js

 

  def new
    @comment = @post.comments.build
    @comment.user = current_user
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    @comment.save 
    redirect_to posts_path(@post)   
  end

  def edit
  end

  def update
    @comment.update_attributes(comment_params)      
  end

  def destroy
    @comment.destroy
  end

 


  
  private

  
  def set_comments
    @comment.post.comments.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
