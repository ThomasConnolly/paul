class Candidates::CommentsController < CommentsController
  before_action :set_commentable



 def index
  super
end

    

private



  def set_commentable
    @commentable = Candidate.find(params[:candidate_id])
  end
end
