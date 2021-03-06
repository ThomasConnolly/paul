# frozen_string_literal: true

class StoryIdeaCommentMailer < ApplicationMailer
  default to: proc { User.with_role(:communicator).pluck(:email) }

  def comment_created(comment)
    @comment = comment
    @url = polymorphic_url(@comment.commentable)
    mail(subject: "There's a new comment for the church Communications Team.")
  end
end
