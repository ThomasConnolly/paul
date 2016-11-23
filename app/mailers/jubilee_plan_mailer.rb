class JubileePlanMailer < ApplicationMailer
  default to: Proc.new { User.where(:jubilee => true).pluck(:email) }
  
  def jubilee_plan_created(jubilee_plan)
    @jubilee_plan = jubilee_plan
    @url = "http://saintpaulsnaples.org/jubilee_plans"
    mail(subject: "There's a new posting for the church Jubilee! Team.")
  end  
end
