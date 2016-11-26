class StoryIdeaMailer < ApplicationMailer
  default to: Proc.new { User.where(:communicator => true).pluck(:email) }
  
  def story_idea_created(story_idea)
    @story_idea = story_idea
    @story_idea_id = story_idea.story_idea
    @url = url_for(@story_idea)
    mail(subject: "There's a new posting for the church Communications Team.")
  end  
end
