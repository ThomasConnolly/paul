class PathwaysMailer < ApplicationMailer
  # default to: Proc.new { User.all.pluck(:email) }

  def pathways_created
    @pathways = Pathway.last
    mail(to: Member.where.not(email: nil).pluck(:email),
         subject: "There's a new Pathways")
  end
end
