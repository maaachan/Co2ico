class Public::UsersController < ApplicationController
before_action :set_user, only: [:followings, :followers]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new

  end

  def edit
    @user= current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)

  end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end



  def unsubscribe
    @user=current_user
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def set_current_user
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :is_deleted)
  end

  def set_user
    @user = User.find(params[:id])
  end



end
