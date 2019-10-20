# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[show edit update destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: 'Your comment was successfully posted.'
    else
      redirect_to :back, notice: "your comment wasn't posted"
    end
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  def edit; end

  def update
    @comment.update(comment_params)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

 

  def comment_params
    params.require(:comment).permit(:body)
  end
end
