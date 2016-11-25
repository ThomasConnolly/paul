class JubileePlanCommentMailer < ApplicationMailer
  default to: Proc.new { User.where(:jubilee => true).pluck(:email) }
  
  def comment_created(comment)
    @commentable = comment.commentable
    @commentable_id = @commentable_id
    @url = url_for(@commentable)
    
    mail(subject: "There's a new comment on a Jubilee! post.")
  end  
end