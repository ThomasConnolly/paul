class SearchMailer < ApplicationMailer
  default to: Proc.new { User.with_role(:searcher).pluck(:email) },
          bcc: Proc.new { User.with_role(:admin).pluck(:email) }

  
  def search_post_created(search_post)
    @search_post = search_post
    @search_post_id = search_post.id
    @url = url_for(@search_report)
    mail(subject: "There's a new posting on the Search page for you to read.")
  end  
end
