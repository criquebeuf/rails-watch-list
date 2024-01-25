class BookmarksController < ApplicationController
  before_action :set_list, only: [ :new, :create, :destroy]
  def new
    # need an empty instance of bookmark
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create
    # create a new bookmark when they click on the submit button
    @bookmark = Bookmark.new(bookmark_params)
    @movies = Movie.all
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # select the bookmark you want to destroy
    @bookmark = @list.bookmark.find(params[:id])
    # destroy it
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
