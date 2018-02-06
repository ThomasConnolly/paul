class SearchTaskCommentMailer < ApplicationMailer
  default to: Proc.new { User.with_role(:searcher).pluck(:email) }
  
  def comment_created(comment)
    @comment = comment
    @url = polymorphic_url(@comment.commentable)
    mail(subject: "There's a new comment for the church Search Team.")
  end  
end
