class JubileePlanCommentMailer < ApplicationMailer
  default to: Proc.new { User.where(:jubilee => true).pluck(:email) }
  
  def comment_created(commentable)
    @commentable = commentable
    @comment = comment
    @url = "http://saintpaulsnaples.org/jubilee_plans"
    mail(subject: "There's a new comment for the church Jubilee! Team.")
  end  
end