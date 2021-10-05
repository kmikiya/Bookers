class BooksController < ApplicationController

  def index
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path

  end

  def show
  end

  def edit
  end

  private
  def book_params
    params.require(:Book).permit(:title, :body)
  end

end
