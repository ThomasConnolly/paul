class SearchQuestionsController < ApplicationController
  before_action :set_search_question, only: [:show, :edit, :update, :destroy]

  # GET /search_questions
  # GET /search_questions.json
  def index
    @search_questions = SearchQuestion.all
  end

  # GET /search_questions/1
  # GET /search_questions/1.json
  def show
  end

  # GET /search_questions/new
  def new
    @search_question = SearchQuestion.new
  end

  # GET /search_questions/1/edit
  def edit
  end

  # POST /search_questions
  # POST /search_questions.json
  def create
    @search_question = SearchQuestion.new(search_question_params)

    respond_to do |format|
      if @search_question.save
        format.html { redirect_to @search_question, notice: 'Search question was successfully created.' }
        format.json { render :show, status: :created, location: @search_question }
      else
        format.html { render :new }
        format.json { render json: @search_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_questions/1
  # PATCH/PUT /search_questions/1.json
  def update
    respond_to do |format|
      if @search_question.update(search_question_params)
        format.html { redirect_to @search_question, notice: 'Search question was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_question }
      else
        format.html { render :edit }
        format.json { render json: @search_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_questions/1
  # DELETE /search_questions/1.json
  def destroy
    @search_question.destroy
    respond_to do |format|
      format.html { redirect_to search_questions_url, notice: 'Search question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_question
      @search_question = SearchQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_question_params
      params.require(:search_question).permit(:question, :characteristic_id, :user_id)
    end
end
