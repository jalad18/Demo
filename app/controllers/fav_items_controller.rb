class FavItemsController < ApplicationController
    include CurrentCart
    before_action :set_favorite, only: [:create]
    before_action :set_fav_item, only: %i[show edit update destroy]


    def index
        @fav_items = FavItem.all
    end

    def show
    end

    def new
        @fav_item = FavItem.new
    end

    def edit
    end

    def create
        @property = Property.find(params[:property_id])
        @fav_item = @favorite.add_favorite(@property)

        respond_to do |format|
            if @fav_item.save
                format.html {redirect_to @fav_item.favorite, notice: "Fav Item was created!!"}
                format.json {render :show, status: :created, location: @fav_item}
            else
                format.html {render :new, status: :unprocessable_entity}
                format.json {render json: @fav_item.errors, status: :unprocessable_entity}
            end
        end
    end

    def destroy
        @favorite = Favorite.find(session[:favorite_id])
        @fav_item.destroy

        respond_to do |format|
            format.html {redirect_to favorite_path, notice: "Favorite item is successfully destroyed!!"}
            format.json {head :no_content}
        end
    end

    private

    def set_fav_item
        @fav_item = FavItem.find(params[:id])
    end

    def set_fav_item_params
        params.require(:fav_item).permit.(:property_id)
    end
end
