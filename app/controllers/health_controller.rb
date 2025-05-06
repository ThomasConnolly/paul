class HealthController < ActionController::Base
  # Skip any filters or callbacks
  skip_before_action :verify_authenticity_token
  
  def check
    render plain: "OK - App is running"
  end
end