class ListingsController < ApplicationController
  
  def destroy
    @listing = current_user.listings.find(params[:id])
    @listing.destroy
    redirect_to user_path(current_user.id)
  end

  def show
    @listing = Listing.find(params[:id])
  end
  
  def edit
    # edit listing
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to user_path(current_user.id)
  end

  def create
    Listing.create(listing_params)
    redirect_to user_path(current_user.id)
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