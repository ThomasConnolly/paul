class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  def index
    @surveys = Survey.all
  end

  def show
    @surveys = Survey.all
    @questions = Question.all
  end

  def new
    @survey = Survey.new
    @survey.questions.build
  end

  def edit
  end

  
  def create
    @survey = Survey.new(survey_params)
      if @survey.save
        redirect_to @survey, notice: 'Survey was successfully created.' 
      else
        render :new
    end
  end

  def update
      if @survey.update(survey_params)
        redirect_to @survey, notice: 'Survey was successfully updated.'
      else
        render :edit
    end
  end

  def destroy
    @survey.destroy
      redirect_to surveys_url, notice: 'Survey was successfully destroyed.'
  end

private
  
  def set_survey
    @survey = Survey.find(params[:id])
  end

  
  def survey_params
      params.require(:survey).permit(:name, questions_attributes: [ :id, :content, :_destroy, answers_attributes: [ :id, :answer_option, :participant_id, :_destroy ]])
  end
end