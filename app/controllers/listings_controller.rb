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
    @listing = Listing.new(listing_params)
    redirect_to user_path(current_user.id)
  end

  def new
    @listing = Listing.new
  end

  def index

    @search_term = params[:search]

    if @search_term.blank?
      @listings = Listing.order(created_at: :desc).page(params[:page])
    else
      @listings = Listing.where("description LIKE ?", "%#{@search_term}%")
    end

    # @listing = Listing.all
    @listings = Listing.order(created_at: :desc).page(params[:page]).per(6)
  end

  def string
    @type = "String"
    # search method return only STRING :instrument_type listing
    @listings = Listing.where("instrument_type LIKE ?", "%#{@type}%")
  end

  def brass
    @type = "Brass"
    # search method return only BRASS :instrument_type listing
    @listings = Listing.where("instrument_type LIKE ?", "%#{@type}%")
  end

  def percussion
    @type = "Percussion"
    # search method return only PERCUSSION :instrument_type listing
    @listings = Listing.where("instrument_type LIKE ?", "%#{@type}%")
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :image, :condition, :instrument_type, :price, :year, :user_id)
  end
end