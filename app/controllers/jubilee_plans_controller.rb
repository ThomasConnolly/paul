class JubileePlansController < ApplicationController
  
  before_action :set_jubilee_plan, only: [:show, :edit, :update, :destroy]


  # GET /jubilees
  # GET /jubilees.json
  def index
    @jubilee_plans = JubileePlan.all
  end

  # GET /jubilees/1
  # GET /jubilees/1.json
  def show
  end

  # GET /jubilees/new
  def new
    @jubilee_plan = JubileePlan.new
  end

  # GET /jubilees/1/edit
  def edit
  end

  # POST /jubilees
  # POST /jubilees.json
  def create
    @jubilee_plan = JubileePlan.new(jubilee_plan_params)

    respond_to do |format|
      if @jubilee_plan.save
        JubileePlanMailer.jubilee_plan_created(@jubilee_plan).deliver_later
        format.html { redirect_to @jubilee_plan, notice: 'Jubilee Plan was successfully created.' }
        format.json { render :show, status: :created, location: @jubilee_plan }
      else
        format.html { render :new }
        format.json { render json: @jubilee_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jubilees/1
  # PATCH/PUT /jubilees/1.json
  def update
    respond_to do |format|
      if @jubilee_plan.update(jubilee_plan_params)
        format.html { redirect_to @jubilee_plan, notice: 'Jubilee Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @jubilee_plan }
      else
        format.html { render :edit }
        format.json { render json: @jubilee_plan.errors, status: :unprocessable_entity }
      end
    end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_jubilee_plan
      @jubilee_plan = JubileePlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jubilee_plan_params
      params.require(:jubilee_plan).permit(:title, :body, :user_name)
    end
end
