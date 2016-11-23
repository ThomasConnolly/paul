class StoryIdeaCommentMailer < ApplicationMailer
  default to: Proc.new { User.where(:communicator => true).pluck(:email) }
  
  def comment_created(commentable)
    @commentable = commentable
    @comment = comment
    @url = "http://saintpaulsnaples.org"
    mail(subject: "There's a new comment for the church Communications Team.")
  end  
end