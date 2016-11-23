class Posts::CommentsController < CommentsController
  before_action :set_commentable
  after_action :send_mail


  
  def send_mail
    if @comment.save
      @commentable = @comment.commentable_id
      PostCommentMailer.comment_created(@comment).deliver_later
    end 
  end




private

  def set_commentable
    @commentable=Post.find(params[:post_id])
  end
end
