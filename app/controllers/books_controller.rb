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
  before_action :admin_only, only: [:new, :edit, :update, :create, :destroy]


  def index
    @books = Book.all
    @import = Book::Import.new
  end

  def import
    @import = Book::Import.new book_import_params
    if @import.save
      redirect_to books_path, notice: "Imported #{@import.imported_count} books"
    else
      @books = Book.all
      flash[:alert] = "There were #{@import.errors_count} errors in your CSV file"
      render action: :index
    end
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

    def admin_only
    unless current_user && current_user.has_role?(:admin)
      redirect_to "/"
    end
  end

    def book_import_params
      params.require(:book_import).permit(:file)
    end
    
    def book_params
      params.require(:book).permit(:author, :title, :subject, :isbn, :dewey, :description)
  end
end
