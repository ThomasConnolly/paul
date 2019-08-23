# frozen_string_literal: true

class JubileePlans::CommentsController < CommentsController
  before_action :set_commentable
  after_action :send_mail

  def send_mail
    if @comment.save
      JubileePlanCommentMailer.comment_created(@comment).deliver_later

  end
end

  private

  def set_commentable
    @commentable = JubileePlan.find(params[:jubilee_plan_id])
  end
end
