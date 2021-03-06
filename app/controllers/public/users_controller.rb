class Public::UsersController < ApplicationController
before_action :set_user, only: [:followings, :followers]
  before_action :search

  def search
    # params[:q]のqには検索フォームに入力した値が入る
    @q = User.ransack(params[:q])
  end

  def index
    # distinct: trueは重複したデータを除外
    @users = @q.result(distinct: true)#.users.page : User.page(params[:page])
    #@users = User.all
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


  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :is_deleted, :favorite)
  end

  def set_user
    @user = User.find(params[:id])
  end



end
