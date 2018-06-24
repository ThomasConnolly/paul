class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :searchers_only
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]



  
  def index
    @candidates = Candidate.includes(:comments).all.order(:last_name)
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
      redirect_to candidate_path(@candidate), notice: "Candidate was updated"
    else
      render :edit
    end
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to candidate_path(@candidate), notice: "Candidate saved"
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


  def searchers_only
    unless current_user.has_role?(:searcher)
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end


  def candidate_params
    params.require(:candidate).permit(:last_name, :full_name, :url, :link1,
     :link2, :link3, :link4, :links_narrative, :photo_link)
  end
end
