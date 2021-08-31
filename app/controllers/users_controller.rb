class UsersController < ApplicationController
  before_action :new_book, only: [:index, :show]
  before_action lambda {
    edit_permission_checker(params[:id].to_i)
  }, only: [:edit, :update]

  def index
    # TODO: 必要がページネーションを追加する
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: I18n.t('views.notice.updated', model: User.t)
    else
      render 'edit'
    end
  end

  private

  def new_book
    @book = current_user.books.build
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email, :password, :password_confirmation)
  end

  def edit_permission_checker(id)
    redirect_to user_path(current_user), alert: I18n.t('views.alert.prohibited.edit') unless current_user.id == id
  end
end
