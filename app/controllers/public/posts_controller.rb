class Public::PostsController < ApplicationController
  def new
   @post = Post.new
   @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end



  def show
    @post = Post.find(params[:id])
  end


  def edit
    #@post.user_id = current_user.id
    @post = Post.find(params[:id])
    @genres = Genre.all

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to post_path(@post.id)
    else
    render:edit
    end
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:post_text, :genre_id, :image)
  end


end
