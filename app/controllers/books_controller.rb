# typed: false
# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update create destroy]
  before_action :admin_only, only: %i[new edit update create destroy]

  def index
    @books = Book.order(:title)
  end

  def books_admin
    @books_admin = Book.order(:id)
    @import = Book::Import.new
    @last_book = Book.last.id

    respond_to do |format|
      format.html
      format.csv do
        send_data(@books_admin.to_csv,
                  filename: "bookLabels-#{Time.zone.today}.csv", disposition: :inline)
      end
    end
  end

  def books_author
    @books = Book.order(:author)
  end

  def books_title
    @books = Book.order(:title)
  end

  def show; end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to(books_admin_path, notice: 'Book was saved')
    else
      render(:new)
    end
  end

  def update
    if @book.update(book_params)
      redirect_to(book_path(@book))
    else
      render(:edit)
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html do
        redirect_to(books_admin_path,
                    notice: 'Book was successfully destroyed.')
      end
      format.json { head(:no_content) }
    end
  end

  def import
    @import = Book::Import.new(book_import_params)
    if @import.save
      redirect_to(books_path,
                  notice: "Imported #{@import.imported_count} books")
    else
      @books = Book.all
      flash[:alert] =
        "There were #{@import.errors.count} errors in your CSV file"
      render(action: :index)
    end
  end

  def set_book
    @book = Book.find(params[:id])
  end

  private

  def admin_only
    return if user_signed_in && current_user.roles.include?('admin')

    redirect_to('/')
  end

  def book_import_params
    params.expect(book_import: [:file])
  end

  def book_params
    params.expect(book: %i[author title subject isbn dewey description
                           cutter url])
  end
end
# http://books.google.com/books/content?id=fDZ6N8BACJkC&printsec=frontcover&img=1&zoom=2&edge=none&source=gbs_api

# http://books.google.com/books/content?id=fDZ6N8BACJkC&printsec=frontcover&img=1&zoom=2&edge=none&source=gbs_api
