# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string           not null
#  description :text
#  deadline    :string           not null
#

class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :all_tasks, only: %i[index create update destroy]
  before_action :set_tasks, only: %i[edit update destroy]

  respond_to :html, :js

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to @tasks
    else
      render :new
    end
  end

  def update
    @task.update_attributes(task_params)
  end

  def destroy
    @task.destroy
  end

  private

  def all_tasks
    @tasks = Task.all
  end

  def set_tasks
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline)
  end
end
