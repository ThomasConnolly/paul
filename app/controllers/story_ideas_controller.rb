# frozen_string_literal: true

# == Schema Information
#
# Table name: story_ideas
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StoryIdeasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story_idea, only: %i[show edit update destroy]
  before_action :find_commentable


  def new
    @story_idea = StoryIdea.new
  end

  def index
    @story_ideas = StoryIdea.includes(:comments).all
    @story_idea = StoryIdea.new
  end

  def show; end

  def edit; end

  def create
    @story_idea = current_user.story_ideas.build(story_idea_params)
    if @story_idea.save
      StoryIdeaMailer.story_idea_created(@story_idea).deliver_later
      redirect_to story_ideas_path
    else
      puts "something went wrong"
      render :new
    end
  end

  def update
    @story_idea.update_attributes(story_idea_params)
    @story_idea.save
  end

  def destroy
    @story_idea.destroy
    redirect_to story_ideas_path
  end

  private

  def set_story_idea
    @story_idea = StoryIdea.find(params[:id])
  end

  def story_idea_params
    params.require(:story_idea).permit(:title, :body, :comments, :url, :story_idea_picture, 
       :user_id)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = StoryIdea.find_by_id(params[:story_idea_id]) if params[:story_idea_id]
  end
end
