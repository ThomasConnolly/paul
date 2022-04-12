class PathwaysMailer < ApplicationMailer
  # default to: Proc.new { User.all.pluck(:email) }

  def pathways_created(pathway)
    @pathway = Pathway.last
    @image = @pathway.image.to_s
    @url = @pathway.link.to_s
    mail(to: Member.where.not(email: nil).pluck(:email),
         subject: "There's a new Pathways")
  end
end
