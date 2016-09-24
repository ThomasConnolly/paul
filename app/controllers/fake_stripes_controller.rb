class FakeStripesController < ApplicationController
  before_action :set_fake_stripe, only: [:show, :edit, :update, :destroy]

  # GET /fake_stripes
  # GET /fake_stripes.json
  def index
    @fake_stripes = FakeStripe.all
  end

  # GET /fake_stripes/1
  # GET /fake_stripes/1.json
  def show
  end

  # GET /fake_stripes/new
  def new
    @fake_stripe = FakeStripe.new
  end

  # GET /fake_stripes/1/edit
  def edit
  end

  # POST /fake_stripes
  # POST /fake_stripes.json
  def create
    @fake_stripe = FakeStripe.new(fake_stripe_params)

    respond_to do |format|
      if @fake_stripe.save
        format.html { redirect_to @fake_stripe, notice: 'Fake stripe was successfully created.' }
        format.json { render :show, status: :created, location: @fake_stripe }
      else
        format.html { render :new }
        format.json { render json: @fake_stripe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fake_stripes/1
  # PATCH/PUT /fake_stripes/1.json
  def update
    respond_to do |format|
      if @fake_stripe.update(fake_stripe_params)
        format.html { redirect_to @fake_stripe, notice: 'Fake stripe was successfully updated.' }
        format.json { render :show, status: :ok, location: @fake_stripe }
      else
        format.html { render :edit }
        format.json { render json: @fake_stripe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fake_stripes/1
  # DELETE /fake_stripes/1.json
  def destroy
    @fake_stripe.destroy
    respond_to do |format|
      format.html { redirect_to fake_stripes_url, notice: 'Fake stripe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fake_stripe
      @fake_stripe = FakeStripe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fake_stripe_params
      params.require(:fake_stripe).permit(:tickets)
    end
end
