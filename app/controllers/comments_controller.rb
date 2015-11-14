class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @comments = @commentable.comments
  end
  
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save

      respond_to do |format|
        format.html { redirect_to @commentable, notice: "Your comment was saved" }
        format.js
    end
  end
 



  private


  def comment_params
    params.require(:comment).permit(:body)
    end
  end
