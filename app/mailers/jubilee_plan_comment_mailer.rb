class JubileePlanCommentMailer < ApplicationMailer
  default to: Proc.new { User.with_role(:jubilee_planner).pluck(:email) }
  
  def comment_created(comment)
    @comment = comment
    @url = polymorphic_url(@comment.commentable)
    mail(subject: "There's a new comment on a Jubilee! post.")
  end 
end