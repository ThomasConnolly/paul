class ParticipantsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :change_path, only: :new
  before_action :set_participant, only: %i[ show edit update destroy ]

  # GET /participants or /participants.json
  def index
    @participants = Participant.all
    @participant = Participant.find(current_user.participant.id)
  end

  # GET /participants/1 or /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants or /participants.json
  def create
    @participant = current_user.build_participant(participant_params)
      if @participant.save
        redirect_to @participant, notice: "We'll be in touch as this program takes shape. Thanks for signing up."
    end
  end

  # PATCH/PUT /participants/1 or /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: "Participant was successfully updated." }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1 or /participants/1.json
  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url, notice: "Participant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def change_path
      if user_signed_in? && current_user.participant.present?
        redirect_to participant_path(current_user.participant)
      end
    end
  

    # Only allow a list of trusted parameters through.
    def participant_params
      params.require(:participant).permit(:session, :first_preferred_day, :first_preferred_time, 
      :second_preferred_day, :second_preferred_time)
    end
  end
