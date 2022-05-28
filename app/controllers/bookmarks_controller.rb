class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id]) # si quisiera crearlos desde la terminal necesitaria el id de list
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list # voy a instanciar a ese bookmark con el id de list(en @list)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

end
