# frozen_string_literal: true

class PreschoolAsController < ApplicationController
  before_action :set_preschool_a, only: %i[show edit update destroy]

  # GET /preschool_as
  # GET /preschool_as.json
  def index
    @preschool_as = PreschoolA.all
  end

  # GET /preschool_as/1
  # GET /preschool_as/1.json
  def show; end

  # GET /preschool_as/new
  def new
    @preschool_a = PreschoolA.new
  end

  # GET /preschool_as/1/edit
  def edit; end

  # POST /preschool_as
  # POST /preschool_as.json
  def create
    @preschool_a = PreschoolA.new(preschool_a_params)

    respond_to do |format|
      if @preschool_a.save
        format.html { redirect_to @preschool_a, notice: 'Preschool a was successfully created.' }
        format.json { render :show, status: :created, location: @preschool_a }
      else
        format.html { render :new }
        format.json { render json: @preschool_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preschool_as/1
  # PATCH/PUT /preschool_as/1.json
  def update
    respond_to do |format|
      if @preschool_a.update(preschool_a_params)
        format.html { redirect_to @preschool_a, notice: 'Preschool a was successfully updated.' }
        format.json { render :show, status: :ok, location: @preschool_a }
      else
        format.html { render :edit }
        format.json { render json: @preschool_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preschool_as/1
  # DELETE /preschool_as/1.json
  def destroy
    @preschool_a.destroy
    respond_to do |format|
      format.html { redirect_to preschool_as_url, notice: 'Preschool a was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_preschool_a
    @preschool_a = PreschoolA.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def preschool_a_params
    params.require(:preschool_a).permit(:I, :II, :III, :IV)
  end
end
