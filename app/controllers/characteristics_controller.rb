class CharacteristicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_characteristic, only: [:show, :edit, :update, :destroy]

  # GET /characteristics
  # GET /characteristics.json
  def index
    @characteristics = Characteristic.all
  end

  # GET /characteristics/1
  # GET /characteristics/1.json
  def show
    @rating = Rating.new
    @rating_user = current_user
    @characteristic_id = @characteristic.id
  end

  # GET /characteristics/new
  def new
    @characteristic = Characteristic.new
    @characteristic.user = current_user
    @characteristic.build_ratings
  end

  # GET /characteristics/1/edit
  def edit
  end

  # POST /characteristics
  # POST /characteristics.json
  def create
    @characteristic = Characteristic.new(characteristic_params)
    @characteristic.user = current_user

    respond_to do |format|
      if @characteristic.save
        format.html { redirect_to @characteristic, notice: 'Characteristic was successfully created.' }
        format.json { render :show, status: :created, location: @characteristic }
      else
        format.html { render :new }
        format.json { render json: @characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characteristics/1
  # PATCH/PUT /characteristics/1.json
  def update
    respond_to do |format|
      if @characteristic.update(characteristic_params)
        format.html { redirect_to @characteristic, notice: 'Characteristic was successfully updated.' }
        format.json { render :show, status: :ok, location: @characteristic }
      else
        format.html { render :edit }
        format.json { render json: @characteristic.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /characteristics/1
  # DELETE /characteristics/1.json
  def destroy
    @characteristic.destroy
    respond_to do |format|
      format.html { redirect_to characteristics_url, notice: 'Characteristic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_characteristic
      @characteristic = Characteristic.find(params[:id])
    # Never trust parameters from the scary internet, only allow the white list through.
    def characteristic_params
      params.require(:characteristic).permit(:name, :definition, :user_id, 
        ratings_attributes: [:score, :characteristic_id, :user_id])
    end
  end
end
