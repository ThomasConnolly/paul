class StoryIdeas::CommentsController < CommentsController
  before_action :set_commentable
  after_action :send_mail
  
  def send_mail
    if @comment.save
      StoryIdeaCommentMailer.comment_created(@commentable_id).deliver_later
  end 
end



private

  def set_commentable
    @commentable=StoryIdea.find(params[:story_idea_id])
  end
end