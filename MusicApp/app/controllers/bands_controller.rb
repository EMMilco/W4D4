class BandsController < ApplicationController
  before_action :ensure_logged_in, except: [:index]
  def index
    @bands = Band.all
    render :index
  end

  def create
    band = Band.new(band_params)
    if band.save
      redirect_to band_url(band)
    else
      flash[:errors] = ["Band must have a unique name."]
      redirect_to new_band_url
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def update
    band = Band.find(params[:id])
    band.update(band_params)
    if band.save
      redirect_to band_url(band)
    else
      flash[:errors] = ["Invalid name."]
      redirect_to edit_band_url(band)
    end
  end

  def destroy
    Band.find(band_params[:id]).destroy
    redirect_to bands_url
  end

private

  def band_params
    params.require(:band).permit(:name)
  end
end
