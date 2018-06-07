class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  
  def index
    @candidates = Candidate.all.order(:last_name)
    @candidate = Candidate.new
  end

  def new
    @candidate = Candidate.new
  end

  def edit
  end

  def show
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to candidates_path
    else
      render :edit
    end
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to candidates_path, notice: "Candidate saved"
    else
      render :new
  end
end




  def destroy
    @candidate.destroy
      redirect_to candidates_path
  end




  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:last_name, :full_name, :url, :link1, :link2, :link3, :links_narrative)
  end
end
