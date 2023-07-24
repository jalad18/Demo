class FavoritesController < ApplicationController
    #rescue_from ActiveRecord::RecordNotFound, with: :invalid_favorite
    #before_action :set_favorite, only: [:show, :destroy]

    before_action :authenticate_user!

    # def create
    #     @property = Property.find(params[:property_id])
    #     current_user.favorites.create(property: @property)
    
    #     redirect_to @property, notice: "Added to favorites!"
    # end
    
    # def destroy
    #     @favorite = current_user.favorites.find(params[:id])
    #     @property = @favorite.property
    #     @favorite.destroy
    
    #     redirect_to @property, notice: "Removed from favorites!"
    # end  

    # private

    # def set_favorite
    #     @favorite = Favorite.find(params[:id])
    # end

    # def favorite_params
    #     params.fetch(:favorite, {})
    # end

    # def invalid_favorite
    #     logger.error "Attempt to access invalid favorite section #{params[:id]}"
    #     redirect_to root_path, notice: "Favorite section doesn't exist!"
    # end
end
