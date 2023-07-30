class CartsController < ApplicationController
    def add_to_cart
        property = Property.find(params[:property_id])
        current_user.carts.create(property: property)

        redirect_to properties_path, notice: "Property added to Wishlist!"
    end

    def show
        @cart_properties = current_user.carts.includes(:property)
    end
end
