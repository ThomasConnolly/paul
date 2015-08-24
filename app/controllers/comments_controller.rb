class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :new, :destroy]
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      CommentMailer.comment_created(current_user,@post.user).deliver
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def destroy
    @comment.destroy
      redirect_to posts_path
  end

  def edit
  end

  def new
  end
  
  def update
    if @comment.update(comments_params)
      redirect_to posts_path(@post)
    else
      render :edit 
    end
  end



  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end