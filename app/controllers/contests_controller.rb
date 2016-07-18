class ContestsController <ApplicationController

helper_method :survey, :participant

def new
  @attempt = survey.attempts.new
end

def create
  @attempt = survey.attempts.new(params[:attempt])
  @attempt.participant = participant
  if @attempt.valid? and @attempt save
      redirect to contests_path
    else
      render :action => :new
    end
  end

  def participant
    @participant ||= current_user
  end

  def survey
    @survey ||= Survey::Survey.active.first
  end
end

