class FavoritesController < ApplicationController
    before_action :authenticate_user!

    def index
        @favorites = current_user.favorites.includes(:property).map(&:property)
    end

    def create
        @property = Property.find(params[:property_id])
        current_user.favorites.create(property: @property)
        redirect_to @property, notice: "Property added to favorites!"
    end
    
    def destroy
        @favorite = current_user.favorites.find_by(property_id: params[:property_id])
        @favorite.destroy if @favorite
        redirect_to property_path(params[:property_id]), notice: "Property removed from favorites!"
    end
end
  