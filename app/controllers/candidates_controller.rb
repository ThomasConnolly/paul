class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.create(candidate_params)
    if @candidate.save
      redirect_to candidates_path
    else
      render 'new'
    end
  end

  def candidate_params
      params.require(:candidates).permit(:first_name, :last_name, :full_name, :url)
    end
end
