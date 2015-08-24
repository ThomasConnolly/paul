class CommentMailer < ApplicationMailer
  
  def comment_created(current_user, post_user)
    @current_user = current_user
    @post_user = post_user

    mail(to: @post_user.email,
         subject: "There's a new comment on your post"
         )
  end
end
