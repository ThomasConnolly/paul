class PrayForsController < ApplicationController
  before_action :set_pray_for, only: [:show, :edit, :update, :destroy]

  # GET /pray_fors
  # GET /pray_fors.json
  def index
    @pray_fors = PrayFor.all
  end

  # GET /pray_fors/1
  # GET /pray_fors/1.json
  def show
  end

  # GET /pray_fors/new
  def new
    @pray_for = PrayFor.new
  end

  # GET /pray_fors/1/edit
  def edit
  end

  # POST /pray_fors
  # POST /pray_fors.json
  def create
    @pray_for = PrayFor.new(pray_for_params)
      if @pray_for.save
        redirect_to posts_path
      else
        render :new
    end
  end

  # PATCH/PUT /pray_fors/1
  # PATCH/PUT /pray_fors/1.json
  def update
    respond_to do |format|
      if @pray_for.update(pray_for_params)
        format.html { redirect_to @pray_for, notice: 'Pray for was successfully updated.' }
        format.json { render :show, status: :ok, location: @pray_for }
      else
        format.html { render :edit }
        format.json { render json: @pray_for.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pray_fors/1
  # DELETE /pray_fors/1.json
  def destroy
    @pray_for.destroy
    respond_to do |format|
      format.html { redirect_to pray_fors_url, notice: 'Pray for was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pray_for
      @pray_for = PrayFor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pray_for_params
      params.require(:pray_for).permit(:first_name, :reason)
    end
end
