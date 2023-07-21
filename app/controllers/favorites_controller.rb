class FavoritesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_favorite
    before_action :set_favorite, only: [:show, :destroy]

    private

    def set_favorite
        @favorite = Favorite.find(params[:id])
    end

    def favorite_params
        params.fetch(:favorite, {})
    end

    def invalid_favorite
        logger.error "Attempt to access invalid favorite section #{params[:id]}"
        redirect_to root_path, notice: "Favorite section doesn't exist!"
    end
end
