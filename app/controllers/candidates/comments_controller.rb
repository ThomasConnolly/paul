class Candidates::CommentsController < CommentsController
  before_action :set_commentable
  after_action :send_mail



  def send_mail
    if @comment.save
      @commentable = @comment.commentable_id
      CandidateCommentMailer.comment_created(@comment).deliver_later
    end
  end

 def index
  super
end



private



  def set_commentable
    @commentable = Candidate.find(params[:candidate_id])
  end
end
