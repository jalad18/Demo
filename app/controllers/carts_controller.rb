# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart_items = if @cart
                    @cart.cart_items.includes(:property)
                  else
                    []
                  end
  end

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
