class FavItemsController < ApplicationController
    include CurrentCart
    before_action :set_favorite, only: [:create]
    before_action :set_fav_item, only: %i[show edit update destroy]

    def index
        @fav_item = FavItem.all
    end

    def new
        @fav_item = FavItem.new
    end

    def show
    end

    def edit
    end

    def create
        favorite = Favorite.find(params[:favorite_id])
        @fav_item = @favorite.add_favorite(favorite)

        respond_to do |format|
            if @fav_item.save
                format.html {redirect_to @fav_item.favorite, notice: "Property was successfully added."}
                format.json {render :show, status: :created, location: @fav_item}
            else
                format.html {render :new, status: :unprocessable_entity}
                format.json {render json: @fav_item.errors, status: :unprocessable_entity}
            end
        end
    end

    def update
        respond_to do |format|
            if @fav_item.update(fav_item_params)
                format.html {redirect_to fav_item_url(@fav_item), notice: "Fav item was successfully created."}
                format.json {render :show, status: :ok, location: @fav_item}
            else
                format.html {render :edit, status: :unprocessable_entity}
                format.json {render json: @fav_item.errors, status: :unprocessable_entity}
            end
        end
    end

    def destroy
        @favorite = Favorite.find(session[:favorite_id])
        @fav_item.destroy

        respond_to do |format|
            format.html {redirect_to favorite_path(@favorite), notice: "Fav item was successfully destroyed."}
            format.json {head :no_content}
        end
    end
    
    private

    def set_fav_item
        @fav_item = FavItem.find(params[:id])
    end

    def fav_item_params
        params.require(:fav_item).permit.(:property_id)
    end
end
