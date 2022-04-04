class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    #@post = current_user.post.build(post_params)

    @post.save
  end

  def index
    @posts = Post.all
  end



  def show
    @post = Post.find(params[:id])
  end


  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:post_text)
  end
end
