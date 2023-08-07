class PaymentsController < ApplicationController
  # before_action :set_property, only: %i[new create]

  def new
    #byebug
    @property = Property.find(params[:property_id])
  end

  def create
    #byebug
    # logger.debug "Property ID: #{params[:property_id]}"
    #byebug
    @property = Property.find(params[:id])
    amount = (@property.price * 0.01 * 100).to_i
  # rescue ActiveRecord::RecordNotFound
  #   flash[:alert] = 'Property not found'
  #   redirect_to properties_path

    customer = Stripe::Customer.create(
      name: current_user.name,
      email: current_user.email,
      description: "Customer id: #{current_user.id}"
    )

    payment_intent = Stripe::PaymentIntent.create(
      amount: amount, # Amount in cents
      currency: 'inr',
      customer: customer.id,
      description: "Payment for Property id: #{@property.id}",
      metadata: {
        property_id: @property.id
      }
    )
    

    session = Stripe::Checkout::Session.create(
      payment_intent_data: {
        setup_future_usage: 'off_session'
      },
      customer: customer.id,
      payment_method_types: ['card'],
      line_items: [{
        price: payment_intent.id, # Use the Payment Intent ID as the price
        quantity: 1
      }],
      mode: 'payment',
      success_url: payments_success_url,
      cancel_url: payments_cancel_url
    )
    redirect_to session.url
  end

  def success
    # handle successful payments
    render 'layouts/_payment_success', notice: 'Token money transfer successful'
  end

  def cancel
    # handle if the payment is cancelled
    redirect_to root_url, notice: 'Token money transfer unsuccessful'
  end

  private

  def property_not_found
    redirect_to properties_path, alert: 'Property not found.'
  end

  # def set_property
  #   @property = Property.find_by(id:params[:property_id])
  # end
end