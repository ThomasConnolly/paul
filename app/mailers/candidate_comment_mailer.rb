class CandidateCommentMailer < ApplicationMailer
  default to: Proc.new { User.with_role(:vestry).pluck(:email) },
          bcc: Proc.new { User.with_role(:admin).pluck(:email) }



  def comment_created(comment)
    @comment = comment
    @url = polymorphic_url(@comment.commentable)
    mail(subject: "A new comment on a candidate for rector has been submitted")
  end
end
