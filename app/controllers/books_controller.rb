class BooksController < ApplicationController
  def new

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
    render action: :index
   end
  end
  def index
    @books = Book.all
  if params[:id].present?
    set_book
  else
    @book = Book.new
  end
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
  if @book.update(book_params)
    flash[:notice]='Book was successfully updated.'
   redirect_to book_path
  else
    flash.now[:alert]="Posting failed"
    render 'edit'
  end
  end
  def destroy
   @book = Book.find(params[:id])
   @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def set_book
    @book = Book.find(params[:id])
  end
end
