class SearchController < ApplicationController
  def index
    @listings = Listing.all
    @listings = Listing.where("description LIKE ?", "%#{params[:query]}%")
  end
end