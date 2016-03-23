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
  before_action :set_story_idea, only: [:show, :edit, :update, :destroy]

  # GET /story_ideas
  # GET /story_ideas.json
  def index
    @story_ideas = StoryIdea.all
  end

  # GET /story_ideas/1
  # GET /story_ideas/1.json
  def show
  end

  # GET /story_ideas/new
  def new
    @story_idea = StoryIdea.new
  end

  # GET /story_ideas/1/edit
  def edit
  end

  # POST /story_ideas
  # POST /story_ideas.json
  def create
    @story_idea = current_user.story_ideas.build(story_idea_params)
    @user = current_user

    respond_to do |format|
      if @story_idea.save
        format.html { redirect_to @story_idea, notice: 'Story idea was successfully created.' }
        format.json { render :show, status: :created, location: @story_idea }
      else
        format.html { render :new }
        format.json { render json: @story_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /story_ideas/1
  # PATCH/PUT /story_ideas/1.json
  def update
    respond_to do |format|
      if @story_idea.update(story_idea_params)
        format.html { redirect_to @story_idea, notice: 'Story idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @story_idea }
      else
        format.html { render :edit }
        format.json { render json: @story_idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /story_ideas/1
  # DELETE /story_ideas/1.json
  def destroy
    @story_idea.destroy
    respond_to do |format|
      format.html { redirect_to story_ideas_url, notice: 'Story idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story_idea
      @story_idea = StoryIdea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_idea_params
      params.require(:story_idea).permit(:title, :body)
    end
end
