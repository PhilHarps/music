class OrdersController < ApplicationController
  
  def new
    @listing = Listing.find(params[:listing_id])

    Stripe.api_key = ENV["STRIPE_API_SECRET"]

    @stripe_checkout_session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @listing.name,
        description: "A Musical Instrument Pre:Loved by #{@listing.user.name}",
        amount: (@listing.price * 100).to_i,
        currency: 'aud',
        quantity: 1,
      }],
      success_url: 'http://secret-mountain-45294.herokuapp.com/success',
      cancel_url: 'http://secret-mountain-45294.herokuapp.com/cancel',
    )
  end

  def create
    # defective create listing
    # render "create"
    # @listing.destroy
    # redirect_to root_path
  end

  def cancel
  end
end