# frozen_string_literal: true

class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  # GET /links/1
  # GET /links/1.json
  def index
    @links = Link.all
    @worship = Link.find_by(event: 'worship')
    @bulletin = Link.find_by(event: 'bulletin')
    @wine = Link.find_by(event: 'wine_time')
    @coffee = Link.find_by(event: 'coffee')
    @day_bible = Link.find_by(event: 'day_bible')
    @evening_bible = Link.find_by(event: 'evening_bible')
    @annual_meeting = Link.find_by(event: 'annual meeting')
  end

  def show
    @link = Link.find(params[:id])
    @worship = Link.find_by(event: 'worship')
    @bulletin = Link.find_by(event: 'bulletin')
    @wine = Link.find_by(event: 'wine_time')
    @coffee = Link.find_by(event: 'coffee')
    @day_bible = Link.find_by(event: 'day_bible')
    @evening_bible = Link.find_by(event: 'evening_bible')
    @annual_meeting = Link.find_by(event: 'annual meeting')
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    redirect_to @link, notice: 'Link was successfully created.' if @link.save
  end

  def update
    @link = Link.find(params[:id])
    redirect_to @link, notice: 'Link was successfully updated.' if @link.update(link_params)
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def admin_only
    current_user.has_role?(:admin)
  end

  # Only allow a list of trusted parameters through.
  def link_params
    params.require(:link).permit(:event, :time, :date, :url)
  end
end
