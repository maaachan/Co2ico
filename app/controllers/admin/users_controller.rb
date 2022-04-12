class Admin::UsersController < ApplicationController
  def index
    @users =User.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params) ? (redirect_to admin_user_path(@user)) : (render :edit)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end

  def ensure_user
    @user = User.find(params[:id])
  end
end

