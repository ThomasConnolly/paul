class CommentsController < ApplicationController
  before_action :authenticate_user!

  

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.save
      redirect_to posts_path
    else
      render 'new'
    end
  end
      

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id]
    @comment.destroy
      redirect_to posts_path(@post)
  end

    


 


  
  private


  def comment_params
    params.require(:comment).permit(:body)
    end
  end
