class MarriageTalksController < ApplicationController
  before_action :set_marriage_talk, only: [:show, :edit, :update, :destroy]

  # GET /marriage_talks
  # GET /marriage_talks.json
  def index
    @marriage_talks = MarriageTalk.all
  end

  # GET /marriage_talks/1
  # GET /marriage_talks/1.json
  def show
  end

  # GET /marriage_talks/new
  def new
    @marriage_talk = MarriageTalk.new
  end

  # GET /marriage_talks/1/edit
  def edit
  end

  # POST /marriage_talks
  # POST /marriage_talks.json
  def create
    @marriage_talk = MarriageTalk.new(marriage_talk_params)

    respond_to do |format|
      if @marriage_talk.save
        format.html { redirect_to @marriage_talk, notice: 'Marriage talk was successfully created.' }
        format.json { render :show, status: :created, location: @marriage_talk }
      else
        format.html { render :new }
        format.json { render json: @marriage_talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marriage_talks/1
  # PATCH/PUT /marriage_talks/1.json
  def update
    respond_to do |format|
      if @marriage_talk.update(marriage_talk_params)
        format.html { redirect_to @marriage_talk, notice: 'Marriage talk was successfully updated.' }
        format.json { render :show, status: :ok, location: @marriage_talk }
      else
        format.html { render :edit }
        format.json { render json: @marriage_talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marriage_talks/1
  # DELETE /marriage_talks/1.json
  def destroy
    @marriage_talk.destroy
    respond_to do |format|
      format.html { redirect_to marriage_talks_url, notice: 'Marriage talk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marriage_talk
      @marriage_talk = MarriageTalk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marriage_talk_params
      params.require(:marriage_talk).permit(:title, :body, :delivered_on)
    end
end
