class BooksController < ApplicationController
before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy]
 
  def index
    @books = Book.all
  end

  def show
  end



  
private

    def book_params
      params.require(:book).permit(:author, :title, :subject, :isbn, :dewey)
    end
end

