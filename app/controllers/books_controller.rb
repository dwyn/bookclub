class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
    redirect_to books_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end

end
