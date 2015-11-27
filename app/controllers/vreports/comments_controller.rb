class Vreports::CommentsController < CommentsController
  before_action :set_commentable


private

  def set_commentable
    @commentable=Vreport.find(params[:vreport_id])
  end
end