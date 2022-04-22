class Public::PostsController < ApplicationController
  def new
   @post = Post.new
   @genres = Genre.all
   @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.price = params[:post][:price].to_i
    @post.user_id = current_user.id
    if @post.save
    redirect_to posts_path
    else
    @genres = Genre.all
    @user = current_user
      render :new
    end
  end

  def index
     @posts = params[:hushtag_id].present? ? Hushtag.find(params[:hushtag_id]).posts.page : Post.page(params[:page])
  end



  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = @post.user
    #gon.post = @post
  end


  def edit
    #@post.user_id = current_user.id
    @post = Post.find(params[:id])
    @genres = Genre.all

  end

  def update
    @post = Post.find(params[:id])
    @post.price = params[:post][:price].to_i
    if @post.update(post_params)
    redirect_to post_path(@post.id)
    else
    render:edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
    redirect_to posts_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:post_text, :genre_id, :image, :favorite, :title, :address, :latitude, :longitude, :post_comment, hushtag_ids: [])
  end

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:post, keys: [:address])
  end
end
