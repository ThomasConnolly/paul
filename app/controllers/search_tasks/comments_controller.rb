class SearchTasks::CommentsController < CommentsController
  before_action :set_commentable
  after_action :send_mail
  
  def send_mail
    if @comment.save
      SearchTaskCommentMailer.comment_created(@comment).deliver_later
  end 
end



private

  def set_commentable
    @commentable=SearchTask.find(params[:search_task_id])
  end
end
