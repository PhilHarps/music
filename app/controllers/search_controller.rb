class SearchController < ApplicationController
  def index
    @listings = Listing.all
    @listings = Listing.where("description LIKE ?",  "%#{params[:query]}%").page(params[:page]).per(6)
  end
end