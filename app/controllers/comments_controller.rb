class CommentsController < ApplicationController
  before_action :authenticate_user!


  def index
    post = Post.find(params[:post_id])
    @comments = post.comments
  end

  def show
    
    post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def new
    post = Post.find params[:post_id]
    @comment = post.comments.build
  end

  def edit
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.create(comment_params)
    @comment.user = current_user
      @comment.save! 
       redirect_to posts_path(@comment.post, 
              anchor: "comment_#{@comment.id}")
  end

  def update
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
    @comment.update_attributes(comment_params)
        redirect_to([@comment.post, @comment]) 
  end

  def destroy
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
    @comment.destroy
      redirect_to post_comments_url 
  end

 




  
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
