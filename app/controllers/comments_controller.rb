class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
  def index
    @comments = Comment.all
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
      redirect_to @commentable, notice: "Your comment was successfully posted."
  end

  def destroy
    @comment.destroy
     redirect_back(fallback_location: root_path)
  end
  
  def edit
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      if @commentable == @candidate
        redirect_to candidates_path
      end
    end
  end



private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end

