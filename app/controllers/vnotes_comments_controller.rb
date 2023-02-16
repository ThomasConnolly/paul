class Vnote::CommentsController < CommentsController
    before_action :set_commentable
  
    private
  
    def set_commentable
      @commentable = Vnote.find(params[:vnote_id])
    end
  end