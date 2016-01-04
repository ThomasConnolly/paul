class CommentsController < ApplicationController
  before_action :authenticate_user!

  #  def new
  #  end

  #  def index
    #  @commentable = find_commentable
    #  @comments = @commentable.all
    #  @comment = @commentable.comments.new
  #  end

  def create
    @comment = @commentable.comments.build comment_params
    @comment.user = current_user
    @comment.save
      redirect_to :back 
  end
    


  def destroy
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable
    @comment.destroy
      redirect_to :back
  end



  private


  def comment_params
    params.require(:comment).permit(:body)
    end
  end
