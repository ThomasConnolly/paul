class VreportCommentMailer < ApplicationMailer
  default to: Proc.new { User.vestry.pluck(:email) },
          bcc: Proc.new { User.admin.pluck(:email) }

  
  def comment_created(commentable)
    @commentable = commentable
    @url = "http://saintpaulsnaples.org"
    mail(subject: "There's a new report comment for you to read.")
  end  
end
