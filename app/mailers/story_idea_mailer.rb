class StoryIdeaMailer < ApplicationMailer
  default to: Proc.new { User.where(:communicator => true).pluck(:email) }
  
  def story_idea_created(story_idea)
    @story_idea = story_idea
    @url = "http://saintpaulsnaples.org"
    mail(subject: "There's a new posting for the church Communications Team.")
  end  
end
