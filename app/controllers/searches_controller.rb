class SearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :searcher_only
  before_action :set_characteristic, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    @characteristics = Characteristic.all
    @characteristic = Characteristic.new
    @candidates = Candidate.all.order(:last_name)
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
  end

  # GET /searches/new
  def new
    @characteristic = Characteristic.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @characteristic = Characteristic.new(characteristic_params)

    respond_to do |format|
      if @characteristic.save
        format.html { redirect_to @search, notice: 'Successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @characteristic.update(characteristic_params)
        format.html { redirect_to @characteristic, notice: 
          'Successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @characteristic.errors, status: 
          :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @characteristic.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 
        'Characteristic successfully destroyed'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_characteristic
      @characteristic = Characteristic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def search_params
    #  params.fetch(:search, {})
    #end

     def searcher_only
    unless current_user.has_role?(:searcher) 
      redirect_to root_path, :alert => "Access is restricted."
    end
  end

    def characteristic_params
      params.require(:characteristic).permit(:name, :user_id, :description) 
    end
end
