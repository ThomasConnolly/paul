# frozen_string_literal: true

class Vreports::CommentsController < CommentsController
  before_action :set_commentable
  after_action :send_mail

  def send_mail
    if @comment.save
      VreportCommentMailer.comment_created(@comment).deliver_later
    end
  end

  private

  def set_commentable
    @commentable = Vreport.find(params[:vreport_id])
  end
end
