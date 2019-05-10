class OrdersController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
  end
end
