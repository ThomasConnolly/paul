class StoryIdeas::CommentsController < CommentsController
    before_action :set_commentable
  
    private
  
    def set_commentable
      @commentable = StoryIdea.find(params[:story_idea_id])
    end
  end