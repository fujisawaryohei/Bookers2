class BooksController < ApplicationController
  before_action :set_book, except: [:index, :create]
  before_action -> {
    check_edit_permission(params[:id])
  }, only: [:edit, :update]

  def index
    # TODO: 必要であればページネーション実装する
    @books = Book.all.order(created_at: :desc)
  end

  def show; end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to books_path
    else
      render 'index'
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy!
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def check_edit_permission(id)
    user_id = Book.find(id).user.id
    unless current_user == user_id
      redirect_to user_path(current_user), alert: "編集権限がありません"
    end
  end
end
