class StoryAssignmentsController < ApplicationController
  before_action :set_story_assignment, only: %i[ show edit update destroy ]

  # GET /story_assignments or /story_assignments.json
  def index
    @story_assignments = StoryAssignment.all
  end

  # GET /story_assignments/1 or /story_assignments/1.json
  def show
  end

  # GET /story_assignments/new
  def new
    @story_assignment = StoryAssignment.new
  end

  # GET /story_assignments/1/edit
  def edit
  end

  # POST /story_assignments or /story_assignments.json
  def create
    @story_assignment = StoryAssignment.new(story_assignment_params)

    respond_to do |format|
      if @story_assignment.save
        format.html { redirect_to story_assignment_url(@story_assignment), notice: "Story assignment was successfully created." }
        format.json { render :show, status: :created, location: @story_assignment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @story_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /story_assignments/1 or /story_assignments/1.json
  def update
    respond_to do |format|
      if @story_assignment.update(story_assignment_params)
        format.html { redirect_to story_assignment_url(@story_assignment), notice: "Story assignment was successfully updated." }
        format.json { render :show, status: :ok, location: @story_assignment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @story_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /story_assignments/1 or /story_assignments/1.json
  def destroy
    @story_assignment.destroy

    respond_to do |format|
      format.html { redirect_to story_assignments_url, status: :see_other, notice: "Story assignment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story_assignment
      @story_assignment = StoryAssignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def story_assignment_params
      params.require(:story_assignment).permit(:story_idea_id, :assigned_to, :status)
    end
end
