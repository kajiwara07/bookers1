class BooksController < ApplicationController
  def new
    @book = Book.new
    @books = Book.all
  end

  def top
  end

  def create
    @book = Book.new(book_params)
   if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
   else
    @books = Book.all
    flash.now[:alert] = "Posting failed"
    render :new
   end
  end
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def change
    rename_colum :books, :title, :本のタイトル
    rename_colum :books, :body, :感想
  end
  def update
  @book = Book.find(params[:id])
  @book.update(book_params)
   redirect_to book_path(@book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)

  end
end
