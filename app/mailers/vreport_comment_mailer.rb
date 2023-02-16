# frozen_string_literal: true

class vnoteCommentMailer < ApplicationMailer
  default to: proc { User.where(role: 'vestry').pluck(:email) },
          bcc: proc { User.where(role: 'admin').pluck(:email) }

  def comment_created(comment)
    @comment = comment
    @url = polymorphic_url(@comment.commentable)
    mail(subject: "There's a new report comment for you to read.")
  end
end
