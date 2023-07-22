class FavItemsController < ApplicationController
    include CurrentCart
    before_action :set_favorite, only: [:create]
    before_action :set_fav_item, only: %i[show edit update destroy]

    def index

    end

    def show

    end
    
    private

    def set_fav_item
        @fav_item = FavItem.find(params[:id])
    end

    def set_fav_item_params
        params.require(:fav_item).permit.(:property_id)
    end
end
