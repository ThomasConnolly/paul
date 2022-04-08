class PathwayMailer < ApplicationMailer
  # default to: Proc.new { User.all.pluck(:email) }

  def pathway_created(pathway)
    @pathway = Pathway.last
    @url = url_for(@pathway)
    mail(to: Member.where.Snot(email: nil).pluck(:email),
         subject: "There's a new Pathways")
  end
end

