
class SearchTasksController < ApplicationController
  before_action :authenticate_user!
  before_action :searchers_only
  before_action :set_search_task, only: [:show, :edit, :update, :destroy]
  before_action :all_search_tasks, only: [:index, :create, :update, :destroy]


  respond_to :html, :js

  def new
    @search_task = SearchTask.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @search_tasks = SearchTask.includes(:comments).all
    @search_task = SearchTask.new
  end

  def show
  end

  def edit
  end

  def create
    @search_task = current_user.search_tasks.build(search_task_params)
      if @search_task.save
        SearchTaskMailer.search_task_created(@search_task).deliver_later
        respond_to do |format|
          format.html { redirect_to search_tasks_path(@search_task) }
          format.js
      end
    end
  end

 
  def update
    @search_task.update_attributes(search_task_params)
    @search_task.save
      respond_to do |format|
      format.html { redirect_to search_tasks_path }
      format.js
    end
  end
 

  def destroy
    @search_task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def searchers_only
      unless current_user.has_role?(:searcher) or current_user.has_role?(:admin)
        redirect_to root_path, :alert => "You must be a member of the St. Paul Search Committee to use this function."
      end
    end

    def all_search_tasks
      @search_tasks = SearchTask.all
    end

    def set_search_task
      @search_task = SearchTask.find(params[:id])
    end

    def search_task_params
      params.require(:search_task).permit(:title, :body, :comments, :url, :search_task_picture, :user_id)
    end
end
