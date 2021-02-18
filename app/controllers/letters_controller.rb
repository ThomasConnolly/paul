# frozen_string_literal: true

class LettersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_letter, only: %i[edit show update destroy]

  def new
    @letter = Letter.new
  end

  def index
    @letters = Letter.all.order(:last_name)
    @import = Letter::Import.new
  end

  def import
    @import = Letter::Import.new letter_import_params
    if @import.save
      redirect_to letters_path, notice: "Imported #{@import.imported_count} letter addresses"
    else
      @letters = Letter.all
      flash[:alert] = "There were #{@import.errors.count} errors in your CSV file"
      render action: :index
    end
  end

  def update
    @letter.update(letter_params)
    @letter.save
    redirect_to letters_path
  end

  def create
    @letter = Letter.new(letter_params)
    if @letter.save
      redirect_to letters_path
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def destroy
    @letter.destroy
    redirect_to letters_path
  end

  private

  def letter_import_params
    params.require(:letter_import).permit(:file)
  end

  def set_letter
    @letter = Letter.find(params[:id])
  end

  def letter_params
    params.require(:letter).permit(:last_name, :salutation, :address1, :address2, :city, :state, :zip, :writer)
  end
end
