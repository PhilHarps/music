class OrdersController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])

    Stripe.api_key = 'sk_test_VcqYoQRDitxf5rSQDYjVIdLx00pt5Cvaax'

    @stripe_checkout_session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @listing.name,
        description: "A Musical Instrument Pre:Loved by #{@listing.user.name}",
        amount: (@listing.price * 100).to_i,
        currency: 'aud',
        quantity: 1,
      }],
      success_url: 'https://localhost:3000/success',
      cancel_url: 'https://localhost:3000/cancel',
    )
  end
end
