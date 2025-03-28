class BooksController < ApplicationController
  before_action :is_matching_login_book, only: [:edit, :update]

  def new
    @book = Book.new
  end
  
  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      flash.now[:notice] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def index
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_book
    book = Book.find(params[:id])
    unless book.id == current_user.id
      redirect_to books_path
    end
  end

end
