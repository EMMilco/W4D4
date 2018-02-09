class AlbumsController < ApplicationController

  before_action :ensure_logged_in

  def new
    @album = Album.new
    render :new
  end

  def create
    album = Album.new(album_params)
    if album.save
      redirect_to album_url(album)
    else
      redirect_to new_band_album_url(album_params[:band_id])
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    album = Album.find(params[:id])
    if album.update(album_params)
      redirect_to album_url(album)
    else
      flash[:errors] = ["Invalid form submission"]
      redirect_to edit_album_url(album)
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to band_url(album.band_id)
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id, :year, :studio)
  end
end
