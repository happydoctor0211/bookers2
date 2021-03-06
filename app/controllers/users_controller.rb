class UsersController < ApplicationController

  def index
    @users = User.all
    @newbook = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @newbook = Book.new
    @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render action: :edit
    else
      @books = current_user.books.all
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)

    else
      render :edit

    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end




end
