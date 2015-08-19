# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class EmailPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/comment_created
  def email
    comment = Comment.last
    CommentMailer.comment_created(comment)
  end

end