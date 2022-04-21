class Admin::PostsController < ApplicationController


  def index
    @post = Post.all
    @posts = params[:hushtag_id].present? ? Hushtag.find(params[:hushtag_id]).posts.page : Post.page(params[:page])
  end



  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
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
    @post = Post.find(params[:id])
    if @post.destroy
    redirect_to admin_posts_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:post_text, :genre_id, :image, :favorite, :latitude, :longitude, :post_comment, hushtag_ids: [])
  end


end
