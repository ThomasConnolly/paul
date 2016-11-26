class VreportCommentMailer < ApplicationMailer
  default to: Proc.new { User.vestry.pluck(:email) },
          bcc: Proc.new { User.admin.pluck(:email) }

  
  def comment_created(comment)
    @comment = comment
    @url = polymorphic_url(@comment.commentable)
    mail(subject: "There's a new report comment for you to read.")
  end  
end
