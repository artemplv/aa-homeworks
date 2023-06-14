class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in

  def index
    @bands = Band.all.order(:id)
    render :index
  end

  def show
    render :show
  end

  def new
    render :new
  end

  def edit
    render :edit
  end

  def create
    new_band = Band.new(band_params)

    if new_band.save
      redirect_to band_url(new_band.id)
    else
      render :new, status: 422
    end
  end

  def update
    band.update(band_params)

    if band.save
      redirect_to band_url(band.id)
    else
      render :edit, status: 422
    end
  end

  def set_band
    @band = Band.find(params[:id])
  end

  private
  
  def band_params
    params.require(:band).permit(:name)
  end

  attr_reader :band
end