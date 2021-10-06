class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end


  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)#ここのbook(モデル).idの意味が分からない。#book(prefix)_path

  end

  def show
    @book = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])#編集されたページのIDが送られてきてそのデータをbookに保存という意味？
    book.update(book_params)#book_paramsは上じゃダメ？
    redirect_to book_path(book)#ここのbook(モデル)の意味が分からない idが消えた
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
