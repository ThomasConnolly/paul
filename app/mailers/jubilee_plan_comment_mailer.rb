class JubileePlanCommentMailer < ApplicationMailer
  default to: Proc.new { User.where(:jubilee => true).pluck(:email) }
  
  def comment_created(comment, commentable)
    @commentable = commentable
    @comment = comment
    @url = polymorphic_url([@commentable, @comment])
    mail(subject: "There's a new comment on a Jubilee! post.")
  end 
end