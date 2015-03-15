class CommentsController < ApplicationController

before_filter :authenticate_user!

def create
  @comment = comment_from_params
  @comment.post_id = params[:post_id]
  @comment.body = params[:comment][:body]
  @comment.user = current_user
  @comment.save
    redirect_to post_path(@comment.post)
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
  
  

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end