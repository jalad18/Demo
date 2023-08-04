class PaymentsController < ApplicationController
    def new
    end
    
    def create
      customer = Stripe::Customer.create({
        :email => params[:stripeEmail],
        :source => params[:stripeToken]
      })
      
      charge = Stripe::PaymentIntent.create({
        :customer => customer.id,
        :amount => 500,
        :description => 'Description of your product',
        :currency => 'usd'
      })

      render partial: 'layouts/payment_success'
    
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_payment_path
    end

end
