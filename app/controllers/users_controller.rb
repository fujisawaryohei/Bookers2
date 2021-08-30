class UsersController < ApplicationController
  before_action :set_user, except: [:index]
  before_action -> {
    check_edit_permission(params[:id])
  }, only: [:edit, :update]

  def index
    # TODO: 必要であればページネーションを追加する
    @users = User.all.order(created_at: :desc)
  end

  def show; end
  
  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email, :password, :password_confirmation)
  end

  def check_edit_permission(id)
    unless current_user.id == id.to_i
      redirect_to user_path(current_user), alert: "編集権限がありません"
    end
  end
end
