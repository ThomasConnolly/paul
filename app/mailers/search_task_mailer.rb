class SearchTaskMailer < ApplicationMailer
  default to: Proc.new { User.with_role(:searcher).pluck(:email) }
  
  def search_task_created(search_task)
    @search_task = search_task
    @search_task_id = search_task.id
    @url = url_for(@search_task)
    mail(subject: "There's a new posting for the search team.")
  end  
end
