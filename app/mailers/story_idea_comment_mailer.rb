class StoryIdeaCommentMailer < ApplicationMailer
  default to: Proc.new { User.where(:communicator => true).pluck(:email) }
  
  def comment_created(comment)
    @comment = comment
    @url = polymorphic_url(@comment.commentable)
    mail(subject: "There's a new comment for the church Communications Team.")
  end  
end