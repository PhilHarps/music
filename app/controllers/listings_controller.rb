class ListingsController < ApplicationController
  def create
    Listing.create(listing_params)
    redirect_to root_path
  end

  def index
    # @listing = Listing.all
    @listings = Listing.order(created_at: :desc).page(params[:page]).per(6)
  end

  private
  
  def listing_params
    params.require(:listing).permit(:name, :description, :image, :condition, :instrument_type, :price, :year, :user_id)
  end
end