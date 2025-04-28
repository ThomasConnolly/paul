# frozen_string_literal: true

# app/controllers/page_contents_controller.rb
class PageContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_content, only: %i[edit update]

  def edit; end

  def update
    if @page_content.update(page_content_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path, notice: "Content was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_content
    @page_content = PageContent.find(params[:id])
  end

  def page_content_params
    params.expect(page_content: %i[title body])
  end

  def authorize_admin
    redirect_to root_path, alert: 'Not authorized' unless current_user&.role?('admin')
  end
end
