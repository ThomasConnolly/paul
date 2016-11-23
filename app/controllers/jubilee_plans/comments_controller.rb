class JubileePlans::CommentsController < CommentsController
  before_action :set_commentable
  after_action :send_mail
  
  def send_mail
    if @comment.save
      @commentable = @comment.commentable_id
      JubileePlanCommentMailer.comment_created(@commentable_id).deliver_later
  end 
end



private

  def set_commentable
    @commentable=JubileePlan.find(params[:jubilee_plan_id])
  end
end
