class CommentsController < ApplicationController
before_action :set_comment, only: [:show, :edit, :update, :new, :destroy]
before_action :authenticate_user!

def create
  
  @post = Post.find(params[:post_id])
  @comment = @post.comments.create(comment_params)
  @comment.user = current_user
  if @comment.save
    redirect_to post_path(@comment.post)
  else
    flash.now[:danger] = "error"
  end
end

  def destroy
    @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to posts_path
    end

  def edit
    @comment = Comment.find(params[:id])
    redirect_to posts_path
  end
  
  def new
  end

  private

  def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :post_id, :user_id)
    end
end