class JubileePlanMailer < ApplicationMailer
  default to: Proc.new { User.with_role(:jubilee_planner).pluck(:email) }
  
  def jubilee_plan_created(jubilee_plan)
    @jubilee_plan = jubilee_plan
    @jubilee_plan_id = jubilee_plan.id
    @url = url_for(@jubilee_plan)
    mail(subject: "There's a new posting for the church Jubilee! Team.")
  end  
end
