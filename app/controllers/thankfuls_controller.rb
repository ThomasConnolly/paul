class ThankfulsController < ApplicationController
  before_action :set_thankful, only: [:show, :edit, :update, :destroy]

  # GET /thankfuls
  # GET /thankfuls.json
  def index
    @thankfuls = Thankful.all
  end

  # GET /thankfuls/1
  # GET /thankfuls/1.json
  def show
  end

  # GET /thankfuls/new
  def new
    @thankful = Thankful.new
  end

  # GET /thankfuls/1/edit
  def edit
  end

  # POST /thankfuls
  # POST /thankfuls.json
  def create
    @thankful = Thankful.new(thankful_params)

    respond_to do |format|
      if @thankful.save
        format.html { redirect_to @thankful, notice: 'Thankful was successfully created.' }
        format.json { render :show, status: :created, location: @thankful }
      else
        format.html { render :new }
        format.json { render json: @thankful.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thankfuls/1
  # PATCH/PUT /thankfuls/1.json
  def update
    respond_to do |format|
      if @thankful.update(thankful_params)
        format.html { redirect_to @thankful, notice: 'Thankful was successfully updated.' }
        format.json { render :show, status: :ok, location: @thankful }
      else
        format.html { render :edit }
        format.json { render json: @thankful.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thankfuls/1
  # DELETE /thankfuls/1.json
  def destroy
    @thankful.destroy
    respond_to do |format|
      format.html { redirect_to thankfuls_url, notice: 'Thankful was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thankful
      @thankful = Thankful.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thankful_params
      params.require(:thankful).permit(:body)
    end
end
