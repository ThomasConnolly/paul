# frozen_string_literal: true

class SyllabusesController < ApplicationController
  before_action :set_syllabus, only: %i[show edit update destroy]

  # GET /syllabuses
  # GET /syllabuses.json

  def index
    @syllabuses = Syllabus.all

    respond_to do |format|
      format.html
      format.csv { send_data @syllabuses.to_csv, filename: "syllabuses-#{Date.today}.csv" }
    end
  end

  def import
    Syllabus.import(params[:file])
    redirect_to root_url, notice: 'Syllabuses imported'
  end

  def preschool
    @syllabuses = Syllabus.where(grade: 'preschool')
    render :index
  end

  def primary
    @syllabuses = Syllabus.where(grade: 'primary')
    render :index
  end

  def intermediate
    @syllabuses = Syllabus.where(grade: 'intermediate')
    render :index
  end

  # GET /syllabuses/1
  # GET /syllabuses/1.json
  def show; end

  # GET /syllabuses/new
  def new
    @syllabus = Syllabus.new
  end

  # GET /syllabuses/1/edit
  def edit; end

  # POST /syllabuses
  # POST /syllabuses.json
  def create
    @syllabus = Syllabus.new(syllabus_params)

    respond_to do |format|
      if @syllabus.save
        format.html { redirect_to @syllabus, notice: 'Syllabus was successfully created.' }
        format.json { render :show, status: :created, location: @syllabus }
      else
        format.html { render :new }
        format.json { render json: @syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /syllabuses/1
  # PATCH/PUT /syllabuses/1.json
  def update
    respond_to do |format|
      if @syllabus.update(syllabus_params)
        format.html { redirect_to @syllabus }
        format.json { render :show, status: :ok, location: @syllabus }
      else
        format.html { render :edit }
        format.json { render json: @syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syllabuses/1
  # DELETE /syllabuses/1.json
  def destroy
    @syllabus.destroy
    respond_to do |format|
      format.html { redirect_to syllabuses_url, notice: 'Syllabus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_syllabus
    @syllabus = Syllabus.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def syllabus_params
    params.require(:syllabus).permit(:year, :grade, :quarter, :theme, :title1, :title2,
                                     :title3, :title4, :title5, :title6, :title7, :title8, :title9)
  end
end
