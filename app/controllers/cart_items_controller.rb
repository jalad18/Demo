# frozen_string_literal: true

# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:destroy]

  def destroy
    @cart_item.destroy
    redirect_to cart_path(current_user.cart), notice: 'Item removed from cart.'
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
