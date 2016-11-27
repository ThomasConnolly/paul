class JubileePlansController < ApplicationController
  before_action :authenticate_user!
  before_action :jubilee_team_only
  before_action :set_jubilee_plan, only: [:show, :edit, :update, :destroy]
  

  # GET /jubilees
  # GET /jubilees.json
  def index
    @jubilee_plans = JubileePlan.all
  end

  # GET /jubilees/1
  # GET /jubilees/1.json
  def show
    @jubilee_plan = JubileePlan.find(params[:id])
  end

  # GET /jubilees/new
  def new
    @jubilee_plan = JubileePlan.new 
  end

  # GET /jubilees/1/edit
  def edit
  end

  # POST /jubilees
  # POST /jubilees.js
  def create
    @jubilee_plan = JubileePlan.new(params[:jubilee_plan])
    @jubilee_plan.user = current_user
      if @jubilee_plan.save
        JubileePlanMailer.jubilee_plan_created(@jubilee_plan).deliver_later
         redirect_to @jubilee_plan, notice: 'Jubilee Plan was successfully created.'
    end
  end

  # PATCH/PUT /jubilees/1
  # PATCH/PUT /jubilees/1.json
  def update
    @jubilee_plan.update(jubilee_plan_params)
      @jubilee_plan.save
        redirect_to @jubilee_plan, notice: 'Jubilee Plan was successfully updated.'
  end

  # DELETE /jubilees/1
  # DELETE /jubilees/1.json
  def destroy
    @jubilee_plan.destroy
    respond_to do |format|
      format.html { redirect_to jubilee_plans_url, notice: 'Jubilee Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    def jubilee_team_only
      unless current_user.jubilee or current_user.communicator  or current_user.admin?
      redirect_to root_path, :alert => "Special authorization needed to view this page"
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_jubilee_plan
      @jubilee_plan = JubileePlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jubilee_plan_params
      params.require(:jubilee_plan).permit(:title, :body, :comments, :user_id)
    end
end
