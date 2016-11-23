class PostCommentMailer < ApplicationMailer
  
  def comment_created(comment)
    @commentable = comment.commentable
    @commentable_id = comment.commentable_id
    @post_id = @commentable_id
    @url = url_for(@commentable)
    
    mail(to: comment.commentable.user.email,
         subject: "There's a new comment on your post"
         )
  end
end
    # @post = post
    # @post_id = post.id
    # @url = post_url(@post)