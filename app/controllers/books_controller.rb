class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end


  def create
    @book = Book.new(book_params)#viewファイルまで飛ばすから@がついてる
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)#ここのbook(モデル).idの意味が分からない。#book(prefix)_path
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])#編集されたページのIDが送られてきてそのデータをbookに保存という意味？
    if @book.update(book_params)#book_paramsは上じゃダメ？
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)#ここのbook(モデル)の意味が分からない idが消えた
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
