class BooksController < ApplicationController
  before_action :set_book, except: [:index, :create]

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
end
