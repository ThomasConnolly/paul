# frozen_string_literal: true

class WorksController < ApplicationController
  before_action :set_work, only: %i[show edit update destroy]

  def index
    @works = Work.all
    @work = Work.new
  end

  def show; end

  def new
    @work = Work.new
  end

  def edit; end

  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.html do
          redirect_to root_path(anchor: 'top'),
                      notice: "Thanks, and may God bless your work. Your
                                words will be transcribed and blessed at our worship services this Sunday, May 28. Join us if you can!"
        end
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marriage_talks/1
  # DELETE /marriage_talks/1.json
  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, status: :see_other, notice: 'Work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_work
    @work = Work.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def work_params
    params.require(:work).permit(:my_act, :honey)
  end
end
