# typed: false
# frozen_string_literal: true

class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: %i[show edit update destroy]
  before_action :set_common_links, only: %i[index show]

  def index
    @links = Link.all
  end

  def show; end

  def new; end
  def edit; end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @link.update(link_params)
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to links_url, status: :see_other,
                           notice: 'Link was successfully destroyed.'
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def set_common_links
    @worship = Link.find_by(event: 'worship')
    @bulletin = Link.find_by(event: 'bulletin')
    @wine = Link.find_by(event: 'wine_time')
    @vestry_meeting = Link.find_by(event: 'vestry_meeting')
  end

  def link_params
    params.expect(link: %i[event time date url])
  end
end
