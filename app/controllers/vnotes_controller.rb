# frozen_string_literal: true

# == Schema Information
#
# Table name: vnotes
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VnotesController < ApplicationController
  before_action :authenticate_user!
  before_action :vestry_only
  before_action :set_vnote, only: %i[show edit update destroy]
  before_action :all_vnotes, only: %i[index create update destroy]

  respond_to :html, :js

  def new
    @vnote = vnote.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @vnotes = vnote.includes(:comments).all
    @vnote = vnote.new
  end

  def show; end

  def create
    @vnote = current_user.vnotes.build(vnote_params)
    if @vnote.save
      VestryMailer.vnote_created(@vnote).deliver_later
      respond_to do |format|
        format.html { redirect_to vnotes_path(@vnote) }
        format.js
      end
    end
  end

  def update
    @vnote.update(vnote_params)
    @vnote.save
    respond_to do |format|
      format.html { redirect_to vnotes_path }
      format.js
    end
  end

  def edit; end

  def destroy
    @vnote.destroy
    redirect_to '/', status: :see_other
  end

  private

  def all_vnotes
    @vnotes = vnote.all
  end

  def set_vnote
    @vnote = vnote.find(params[:id])
  end

  def vnote_params
    params.require(:vnote).permit(:body, :title, :comments)
  end

  def vestry_only
    unless current_user.vestry? || current_user.admin?
      redirect_to root_path, alert: 'You must be a member of the St. Paul Vestry to use this function.'
    end
  end
end
