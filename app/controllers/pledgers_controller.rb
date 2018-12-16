class PledgersController < ApplicationController
  before_action :set_pledger, only: [:show, :edit, :update, :destroy]

  # GET /pledgers
  # GET /pledgers.json
  def index
    @pledgers = Pledger.all
  end

  # GET /pledgers/1
  # GET /pledgers/1.json
  def show
  end

  # GET /pledgers/new
  def new
    @pledger = Pledger.new
  end

  # GET /pledgers/1/edit
  def edit
  end

  # POST /pledgers
  # POST /pledgers.json
  def create
    @pledger = Pledger.new(pledger_params)

    respond_to do |format|
      if @pledger.save
        format.html { redirect_to @pledger, notice: 'Pledger was successfully created.' }
        format.json { render :show, status: :created, location: @pledger }
      else
        format.html { render :new }
        format.json { render json: @pledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pledgers/1
  # PATCH/PUT /pledgers/1.json
  def update
    respond_to do |format|
      if @pledger.update(pledger_params)
        format.html { redirect_to @pledger, notice: 'Pledger was successfully updated.' }
        format.json { render :show, status: :ok, location: @pledger }
      else
        format.html { render :edit }
        format.json { render json: @pledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pledgers/1
  # DELETE /pledgers/1.json
  def destroy
    @pledger.destroy
    respond_to do |format|
      format.html { redirect_to pledgers_url, notice: 'Pledger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pledger
      @pledger = Pledger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pledger_params
      params.require(:pledger).permit(:last_name, :salutation, :address1, :address2, :city, :state, :postal_code, :type, :northern_city)
    end
end
