# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  author     :string(255)
#  title      :string(255)
#  subject    :string(255)
#  isbn       :string(255)
#  dewey      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]



  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
   end
 end

  def show
  end

  def update
      if @book.update(book_params)
          redirect_to @book
      else
        render :edit 
    end
  end
  
  def destroy
    @book.destroy
      redirect_to books_path
  end



  def set_book
    @book = Book.find(params[:id])
  end



  private
    def book_params
      params.require(:book).permit(:author, :title, :subject, :isbn, :dewey)
  end
end
