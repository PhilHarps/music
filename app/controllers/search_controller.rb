class SearchController < ApplicationController
  def index
    @listings = Listing.where('description like ?', "%#{params[:query]}%")
  end
end