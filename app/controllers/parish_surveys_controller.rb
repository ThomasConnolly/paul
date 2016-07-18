class ParishSurveysController < ApplicationController
  before_action :set_parish_survey, only: [:show, :edit, :update, :destroy]

  # GET /parish_surveys
  # GET /parish_surveys.json
  def index
    @parish_surveys = ParishSurvey.all
  end

  # GET /parish_surveys/1
  # GET /parish_surveys/1.json
  def show
  end

  # GET /parish_surveys/new
  def new
    @parish_survey = ParishSurvey.new
  end

  # GET /parish_surveys/1/edit
  def edit
  end

  # POST /parish_surveys
  # POST /parish_surveys.json
  def create
    @parish_survey = ParishSurvey.new(parish_survey_params)

    respond_to do |format|
      if @parish_survey.save
        format.html { redirect_to @parish_survey, notice: 'Parish survey was successfully created.' }
        format.json { render :show, status: :created, location: @parish_survey }
      else
        format.html { render :new }
        format.json { render json: @parish_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parish_surveys/1
  # PATCH/PUT /parish_surveys/1.json
  def update
    respond_to do |format|
      if @parish_survey.update(parish_survey_params)
        format.html { redirect_to @parish_survey, notice: 'Parish survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @parish_survey }
      else
        format.html { render :edit }
        format.json { render json: @parish_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parish_surveys/1
  # DELETE /parish_surveys/1.json
  def destroy
    @parish_survey.destroy
    respond_to do |format|
      format.html { redirect_to parish_surveys_url, notice: 'Parish survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parish_survey
      @parish_survey = ParishSurvey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parish_survey_params
      params.require(:parish_survey).permit(:title,
                                      questions_attributes: [:content,
                                        answers_attributes: [:content, :comment]]
                                        )
    end
end
