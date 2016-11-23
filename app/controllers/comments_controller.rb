# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#  commentable_id   :integer
#  commentable_type :string
#

class CommentsController < ApplicationController
  before_action :authenticate_user!


  #  def index
    #  @commentable = find_commentable
    #  @comments = @commentable.all
    #  @comment = @commentable.comments.new
  #  end

    def create
      @comment = @commentable.comments.new comment_params
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
