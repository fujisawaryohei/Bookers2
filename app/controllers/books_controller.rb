class BooksController < ApplicationController
  before_action :new_book, only: [:index, :show]
  before_action -> {
    permission_checker(params[:id])
  }, only: [:edit, :update, :destroy]

  def index
    # TODO: 必要であればページネーション実装する
    @books = Book.all.order(created_at: :desc)
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @new_book = current_user.books.build(book_params)
    if @new_book.save
      redirect_to book_path(@new_book)
    else
      @books = Book.all.order(created_at: :desc)
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy!
    redirect_to books_path
  end

  private

  def new_book
    @new_book = current_user.books.build
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def permission_checker(id)
    user_id = Book.find(id).user.id
    unless current_user.id == user_id
      redirect_to user_path(current_user), alert: "編集権限がありません"
    end
  end
end
