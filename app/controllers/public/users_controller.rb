class Public::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
    @posts = @user.posts

  end

  def edit
    @user= current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
