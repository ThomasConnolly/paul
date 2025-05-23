# typed: false
# frozen_string_literal: true

class SurveysController < ApplicationController
  before_action :set_survey, only: %i[show edit update destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show; end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit; end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html do
          redirect_to(@survey, notice: 'Survey was successfully created.')
        end
        format.json { render(:show, status: :created, location: @survey) }
      else
        format.html { render(:new) }
        format.json do
          render(json: @survey.errors, status: :unprocessable_entity)
        end
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html do
          redirect_to(@survey, notice: 'Survey was successfully updated.')
        end
        format.json { render(:show, status: :ok, location: @survey) }
      else
        format.html { render(:edit) }
        format.json do
          render(json: @survey.errors, status: :unprocessable_entity)
        end
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html do
        redirect_to(surveys_url, status: :see_other,
                                 notice: 'Survey was successfully destroyed.')
      end
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_survey
    @survey = Survey.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def survey_params
    params.expect(survey: %i[q1 q2 q3 a1 a2 a3 added_comments])
  end
end
