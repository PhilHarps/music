class ListingsController < ApplicationController
  def create
    Listing.create(listing_params)
    redirect_to root_path
  end

  def index
    @listings = Listing.all
  end

  private
  def listing_params
    params.require(:listing).permit(:name, :description, :image, :condition, :instrument_type, :price, :year, :user_id)
  end
end