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
  before_action :all_story_ideas, only: %i[index create update destroy]

  respond_to :html, :js

  def new
    @story_idea = StoryIdea.new
    respond_to do |format|
      format.html
      format.js
    end
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
      respond_to do |format|
        format.html { redirect_to story_ideas_path(@story_idea) }
        format.js
      end
  end
  end

  def update
    @story_idea.update_attributes(story_idea_params)
    @story_idea.save
    respond_to do |format|
      format.html { redirect_to story_ideas_path }
      format.js
    end
  end

  def destroy
    @story_idea.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def all_story_ideas
    @story_ideas = StoryIdea.all
  end

  def set_story_idea
    @story_idea = StoryIdea.find(params[:id])
  end

  def story_idea_params
    params.require(:story_idea).permit(:title, :body, :comments, :url, :story_idea_picture, :content, :user_id)
  end
end
