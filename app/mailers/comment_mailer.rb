class CommentMailer < ApplicationMailer
  def comment_created(comment)
    @comment = comment
    @post = @comment.post

    mail to: @post.user.email,
         subject: "There's a new comment on your post"
  end
end
