class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
    @users = User.all
    @new_book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
