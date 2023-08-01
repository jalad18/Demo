# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart, only: %i[show checkout]

  def show
    @cart_items = @cart&.cart_items&.includes(:property)
  end

  # def checkout
  # Your checkout logic here
  # Send email to the agent with the cart items and customer details
  # Clear the cart after successful checkout
  # Implement your desired behavior for handling the checkout process
  # redirect_to @cart, notice: 'Checkout complete! An email has been sent to the agent.'
  # end

  private

  def set_cart
    @cart = current_user.carts.find_by(id: params[:id])

    # If cart is nil, create a new cart for the current user
    @cart = current_user.carts.create if @cart.nil?

    # Ensure the cart belongs to the current user
    return unless @cart.user != current_user

    redirect_to root_path, alert: 'You do not have permission to access this cart.'
  end
end
