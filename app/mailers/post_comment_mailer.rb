# frozen_string_literal: true

class PostCommentMailer < ApplicationMailer
  def comment_created(comment)
    @comment = comment
    @url = polymorphic_url(@comment.commentable)

    mail(to: comment.commentable.user.email,
         subject: "There's a new comment on your post")
  end
end
# @post = post
# @post_id = post.id
# @url = post_url(@post)
