class ListingsController < ApplicationController
  
  # Added 8/5/2019
  # Unsure whether this is will affect school-user
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # actions that only a user can take
  before_action :check_user, only: [:edit, :update, :destroy]


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
 
    @listing = Listing.create(listing_params)

    # common patterns in rails
    if @listing.valid?
      redirect_to user_path(current_user.id)
    else
      render "new"
    end
  end

  def new
    @listing = Listing.new
  end

  def index
    @search_term = params[:search]
    if @search_term.blank?
      @listings = Listing.order(created_at: :desc).page(params[:page]).per(6)
    else
      @listings = Listing.where("description LIKE ?", "%#{@search_term}%").page(params[:page]).per(6)
    end
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

      # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

  def listing_params
    params.require(:listing).permit(:name, :description, :image, :condition, :instrument_type, :price, :year, :user_id)
  end

      # checks current user is the same person who created the listing in question
    # if not the same user, they will be redirected to home page with an alert
    def check_user
      @listing = Listing.find(params[:id])
      if current_user != @listing.user
        redirect_to root_url, alert: "Sorry, this listing belongs to someone else."
      end
    end
end