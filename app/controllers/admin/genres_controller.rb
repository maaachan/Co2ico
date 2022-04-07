class Admin::GenresController < ApplicationController
  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admin_genres_path
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
  end

  def update
  end

  private
  def genre_params #ストロングパラメータ
    params.require(:genre).permit(:name) #パラメーターのキー
  end
end
