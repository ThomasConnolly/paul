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
  end

  def show
    @link = Link.find(params[:id])
    @worship = Link.find_by(event: 'worship')
    @bulletin = Link.find_by(event: 'bulletin')
    @wine = Link.find_by(event: 'wine_time')
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
      format.html { redirect_to links_url, status: :see_other, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def admin_only
    unless user_signed_in? && current_user.admin?
      redirect_to '/'
  end

  # Only allow a list of trusted parameters through.
  def link_params
    params.require(:link).permit(:event, :time, :date, :url)
  end
end
end
