class BooksController < ApplicationController


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @newbook = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_parh
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
