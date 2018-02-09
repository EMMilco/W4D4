class TracksController < ApplicationController
  before_action :ensure_logged_in
  def new
    @track = Track.new
    render :new
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album
    render :edit
  end

  def create
    track = Track.new(track_params)
    if track.save
      redirect_to track_url(track)
    else
      flash[:errors] = ["Invalid form submission"]
      redirect_to new_album_track_url(track_params[:album_id])
    end
  end

  def update
    track = Track.find(params[:id])
    if track.update(track_params)
      redirect_to track_url(track)
    else
      flash[:errors] = ["Invalid form submission"]
      redirect_to edit_track_url(track)
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy
    redirect_to album_url(track.album_id)
  end

  private

  def track_params
    params.require(:track).permit(:lyrics, :album_id, :title, :ord, :bonus, :title)
  end
end
