class UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    # TODO: 必要であればページネーションを追加する
    @users = User.all
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
